//
//  EmployeesTests.swift
//  EmployeesTests
//
//  Created by Daniel Bolivar Herrera on 15/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import XCTest
@testable import Employees

class EmployeeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Test that the Codable parser is able to decode the json format into a Employee object
    func testEmployeeCodable() {

        // properties to match
         let uid = "a98f8a2e-c975-4ba3-8b35-01f719e7de2d"
         let fullName = "Camille Rogers"
         let phone = "5558531970"
         let email = "crogers.demo@squareup.com"
         let bio = "Designer on the web marketing team."

         let thumb = "https://s3.amazonaws.com/sq-mobile-interview/photos/5095a907-abc9-4734-8d1e-0eeb2506bfa8/small.jpg"
         let photo =  "https://s3.amazonaws.com/sq-mobile-interview/photos/5095a907-abc9-4734-8d1e-0eeb2506bfa8/large.jpg"

        let team = "Public Web & Marketing"
        let empType: EmployeeType = .partTime

        let fileUrl = Bundle.main.url(forResource: "Employee", withExtension: "json")
        do {
            guard let fileUrl = fileUrl else {
                XCTFail("Error retrieving Employee json file")
                return
            }

            let empData = try Data(contentsOf: fileUrl)
            let employee = try JSONDecoder().decode(Employee.self, from: empData)

            //Check once parsed, individual properties match
            //Ideally there would be an up to date mechanism to grab a up to date employee json from the backend
            XCTAssertEqual(employee.uuid, uid)
            XCTAssertEqual(employee.fullName, fullName)
            XCTAssertEqual(employee.phoneNumber, phone)
            XCTAssertEqual(employee.emailAddress, email)
            XCTAssertEqual(employee.biography, bio)
            XCTAssertEqual(employee.photoURLSmall, thumb)
            XCTAssertEqual(employee.photoURLLarge, photo)
            XCTAssertEqual(employee.team, team)
            XCTAssertEqual(employee.employeeType, empType)

        } catch (let error) {
            XCTFail("\nError decoding Employee json into object: \(error)\n")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
