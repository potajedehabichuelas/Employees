//
//  EmployeesRouterTests.swift
//  EmployeesTests
//
//  Created by Daniel Bolivar Herrera on 15/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import XCTest

class EmployeesRouterTests: XCTestCase {

    var employeeService: EmployeesServiceProtocol!

    override func setUpWithError() throws {
        self.employeeService = EmployeesService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Test API is reachable
    func testEmployeesAPIReachable() {

        let ex = expectation(description: "Expecting a response from Employees API")

        self.employeeService.getEmployees(completion: { response in
            if case .failure(let error) = response {
                print(error.localizedDescription)
            }
            ex.fulfill()
        })

        waitForExpectations(timeout: 15) { (error) in
            if let error = error {
                XCTFail("Timeout error: \(error)")
            }
        }
    }

    //Test that the API returns a valid result
    func testEmployeeAPI() {

        let ex = expectation(description: "Expecting a success return from the api")

        self.employeeService.getEmployees(completion: { response in

            switch response {
                case .success:
                    ex.fulfill()
                case .failure(let error):
                    print(error.localizedDescription)
                    XCTFail("Return object is nil");
            }
        })

        waitForExpectations(timeout: 15) { (error) in
            if let error = error {
                XCTFail("Timeout error: \(error)")
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
