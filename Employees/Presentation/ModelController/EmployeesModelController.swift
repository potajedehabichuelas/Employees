//
//  EmployeesModelController.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 18/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//


protocol EmployeesModelControllerProtocol: class {
    func count() -> Int
    func getEmployees(completion: @escaping (Bool) -> Void)
    func employeeAt(index: Int) -> EmployeeProtocol
}

class EmployeesModelController: ArrayViewModel {
    typealias ViewModel = Employee
    var viewModel: [Employee] = []

    private let employeeService: EmployeesServiceProtocol

    init(employeesService: EmployeesServiceProtocol) {
        self.employeeService = employeesService
    }
}

// MARK: - EmployeesModelController implementation
extension EmployeesModelController: EmployeesModelControllerProtocol {

    func getEmployees(completion: @escaping (Bool) -> Void) {
        self.employeeService.getEmployees(completion: { response in
                 switch response {
                     case .success(let employeesObj):
                        guard let employees = employeesObj else {
                            completion(false)
                            return
                        }
                        //Sort employees by name
                        self.viewModel = employees.employees.sorted(by: { $0.fullName < $1.fullName })
                        completion(true)
                     case .failure(let error):
                         print(error.localizedDescription)
                         completion(false)
                 }
             })
    }

    func employeeAt(index: Int) -> EmployeeProtocol {
        return self.viewModel[index]
    }
}
