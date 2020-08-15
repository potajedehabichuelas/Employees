//
//  Employees.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 15/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import Foundation

// MARK: - Employees
struct Employees: Codable  {
    let employees: [Employee]

    enum CodingKeys: String, CodingKey {
        case employees = "employees"
    }
}
