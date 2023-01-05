//
//  UsersListViewControllerTest.swift
//  SimpleVIPExampleTests
//
//  Created by Vishal_Malvi on 04/01/23.
//

import XCTest
@testable import SimpleVIPExample

final class UsersListViewControllerTest: XCTestCase {
    
    var viewController: UsersListViewController!
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        viewController = UsersListConfigurator.createScene()
        window.addSubview(viewController.view)
    }
    
    override func tearDown() {
        super.tearDown()
        window = nil
        viewController = nil
    }
    
    func testViewController() {
        viewController.viewDidLoad()
        viewController.reloadTableView()
        viewController.selectedUser(User(userId: 1, firstName: "TestName", lastName: "TestLastName", phoneNumber: "1234567890", emailAddress: "Test@gmail.com"))
    }
    
}