//
//  TestAPIConstants.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 15/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import UIKit

struct TestAPIPath {

    enum TestEmployees: String {
        case list = "employees.json"
        case listMalformed = "employees_malformed.json"
        case listEmpty = "employees_empty.json"
    }
}
