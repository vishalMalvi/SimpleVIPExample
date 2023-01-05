//
//  UserDetailsConfiguratorTest.swift
//  SimpleVIPExampleTests
//
//  Created by Vishal_Malvi on 05/01/23.
//

import XCTest
@testable import SimpleVIPExample

final class UserDetailsConfiguratorTest: XCTestCase {
    
    var viewController: UserDetailsViewController?
    
    override func setUp() {
        super.setUp()
        viewController = UserDetailsConfigurator.createScene(user: User(userId: 1, firstName: "TestName", lastName: "TestLastName", phoneNumber: "1234567890", emailAddress: "Test@gmail.com"))
    }
    
    override func tearDown() {
        viewController = nil
    }
    
    func testCreateScene() {
        XCTAssertNotNil(viewController)
    }
}
