//
//  EmployeesRouter.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 15/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import Alamofire

enum EmployeesRouter: APIRouter {

    case getEmployees

    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .getEmployees:
            return .get
        }
    }

    // MARK: - Path
    var path: String {
        switch self {
        case .getEmployees:
            return APIPath.Employees.list.rawValue
        }
    }

    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .getEmployees:
            return nil
        }
    }
}
