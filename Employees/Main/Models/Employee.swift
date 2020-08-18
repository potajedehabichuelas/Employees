//
//  Employee.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 15/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import Foundation

enum EmployeeType: String, Codable {
    case fullTime = "FULL_TIME"
    case partTime = "PART_TIME"
    case contractor = "CONTRACTOR"

    func UIString() -> String {
        switch self {
        case .fullTime:
            return "Full Time"
        case .partTime:
            return "Part Time"
        case .contractor:
            return "Contractor"
        }
    }
}

//Protocol that hides the underlying Employee Model
protocol EmployeeProtocol {
    var uuid : String  { get }
    var fullName : String  { get }
    var emailAddress: String  { get }
    var team: String  { get }

    var employeeType: EmployeeType { get }

    var biography: String?  { get }
    var photoURLSmall: String? { get }
    var photoURLLarge: String? { get }
    var phoneNumber : String? { get }
}

// MARK: - Employee
struct Employee: Codable {
    let uuid : String
    let fullName : String
    let emailAddress: String
    let team: String

    let employeeType: EmployeeType

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
