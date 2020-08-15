//
//  EmployeesService.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 15/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import Alamofire

protocol EmployeesServiceProtocol {
    func getEmployees(completion: @escaping (Result<Data?, Error>) -> Void)
}

class EmployeesService: RequestService {

    // MARK: - We could have a custom init method in case we needed extra parameters for this service
    //       - (i.e auth, filters for the employee, etc...
    //    required init(paramName: param) {
    //
    //    }
}

// MARK: - BeaconServiceProtocol implementation
extension EmployeesService: EmployeesServiceProtocol {

    func getEmployees(completion: @escaping (Result<Data?, Error>) -> Void) {
        self.performRequest(route: EmployeesRouter.getEmployees, completion: completion)
    }
}
