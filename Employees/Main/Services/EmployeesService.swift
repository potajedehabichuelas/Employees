//
//  EmployeesService.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 15/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import Alamofire

protocol EmployeesServiceProtocol {
    func getEmployees(completion: @escaping (Result<Employees?, Error>) -> Void)
}

class EmployeesService: RequestService {

    // MARK: - We could have a custom init method in case we needed extra parameters for this service
    //       - (i.e auth, filters for the employee, etc...
    //    required init(paramName: param) {
    //
    //    }

    struct FilePath {
        static let employees = "employees.json"
    }
}

// MARK: - BeaconServiceProtocol implementation
extension EmployeesService: EmployeesServiceProtocol {

    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }

    private func getEmployeesFilePath() -> URL {
        return self.getDocumentsDirectory().appendingPathComponent(FilePath.employees)
    }

    func retrieveSavedEmployees() -> Employees? {
        let employeesFilePath = self.getEmployeesFilePath()
        let decoder = JSONDecoder()

        do {
            let employeesJSON = try Data(contentsOf: employeesFilePath)
            return try decoder.decode(Employees.self, from: employeesJSON)
        } catch {
            print("Error retrieving employees from file \(error)")
            return nil
        }
    }

    func getEmployees(completion: @escaping (Result<Employees?, Error>) -> Void) {

        if let savedEmployees = self.retrieveSavedEmployees() {
            completion(Result.success(savedEmployees))
        } else {
            self.performCodableRequest(route: EmployeesRouter.getEmployees, completion: { [weak self] (result: Result<Employees?, Error>) in
                switch result {
                    case .success(let employeesObj):
                        // convert employees to json
                        let encoder = JSONEncoder()
                        encoder.outputFormatting = .prettyPrinted

                        //Build path for json file
                        guard let employeesFilePath = self?.getEmployeesFilePath() else {
                            print("Could not find documents filepath")
                            return
                        }
                        do {
                            let employeesJSON = try encoder.encode(employeesObj)
                            try employeesJSON.write(to: employeesFilePath)
                        } catch {
                            print("Error converting employees to JSON \(error)")
                        }
                        completion(result)

                        //Save them to file
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            })
        }
    }
}
