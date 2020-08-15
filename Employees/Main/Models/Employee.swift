//
//  Employee.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 15/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import Foundation

// MARK: - Employee
struct Employee: Codable {
    let uuid : String
    let fullName : String
    let emailAddress: String
    let team: String
    let employeeType: String

    let biography: String?
    let photoURLSmall: String?
    let photoURLLarge: String?
    let phoneNumber : String?

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case fullName = "full_name"
        case emailAddress = "email_address"
        case team = "team"
        case employeeType = "employee_type"

        case biography = "biography"
        case photoURLSmall = "photo_url_small"
        case photoURLLarge = "photo_url_large"
        case phoneNumber = "phone_number"

    }
}
