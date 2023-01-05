//
//  UsersListPresenterTest.swift
//  SimpleVIPExampleTests
//
//  Created by Vishal_Malvi on 04/01/23.
//

import XCTest
@testable import SimpleVIPExample

final class UsersListPresenterTest: XCTestCase {
    
    var presenter: UsersListPresenter!
    var mockDisplay: MockUsersListDisplayLogic!
    
    override func setUp() {
        super.setUp()
        presenter = UsersListPresenter()
        mockDisplay = MockUsersListDisplayLogic()
        presenter.viewController = mockDisplay
        
    }
    
    override func tearDown() {
        super.tearDown()
        presenter = nil
        mockDisplay = nil
    }
    
    func testPresenter() {
        let user = User(userId: 1, firstName: "TestName", lastName: "TestLastName", phoneNumber: "1234567890", emailAddress: "Test@gmail.com")
        let usersList = UsersList(users: [user], title: "TestTitle")
        presenter.presentUsersData(usersList)
        XCTAssertTrue(mockDisplay.displayUsersDataCalled)
    }
}

class MockUsersListDisplayLogic: UsersListDisplayLogic {
    
    var displayUsersDataCalled = false
    
    func displayUsersData(usersDataSource: SimpleVIPExample.UsersListDataSource, title: String) {
        displayUsersDataCalled = true
    }
}
