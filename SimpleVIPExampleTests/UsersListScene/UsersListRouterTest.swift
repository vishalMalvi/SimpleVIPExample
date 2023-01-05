//
//  UsersListRouterTest.swift
//  SimpleVIPExampleTests
//
//  Created by Vishal_Malvi on 04/01/23.
//

import XCTest
@testable import SimpleVIPExample

final class UsersListRouterTest: XCTestCase {
    
    var router: UsersListRouter!
    var viewController: UsersListViewController!
    
    override func setUp() {
        super.setUp()
        router = UsersListRouter()
        viewController = UsersListConfigurator.createScene()
        router.viewController = viewController
        router.navigateToUserDetailsController(User(userId: 1, firstName: "TestName", lastName: "TestLastName", phoneNumber: "1234567890", emailAddress: "Test@gmail.com"))
    }
    
    override func tearDown() {
        super.tearDown()
        router = nil
        viewController = nil
    }
    
    func testRouter() {
        router.navigateToUserDetailsController(User(userId: 1, firstName: "TestName", lastName: "TestLastName", phoneNumber: "1234567890", emailAddress: "Test@gmail.com"))
    }
}
