//
//  UsersDetailsPresenterTest.swift
//  SimpleVIPExampleTests
//
//  Created by Vishal_Malvi on 05/01/23.
//

import XCTest
@testable import SimpleVIPExample

final class UsersDetailsPresenterTest: XCTestCase {
    
    var presenter: UsersDetailsPresenter!
    var mockDisplay: MockUserDetailsDisplayLogic!
    
    override func setUp() {
        super.setUp()
        presenter = UsersDetailsPresenter()
        mockDisplay = MockUserDetailsDisplayLogic()
        presenter.viewController = mockDisplay
        
    }
    
    override func tearDown() {
        super.tearDown()
        presenter = nil
        mockDisplay = nil
    }
    
    func testPresenter() {
        let user = User(userId: 1, firstName: "TestName", lastName: "TestLastName", phoneNumber: "1234567890", emailAddress: "Test@gmail.com")
        presenter.presentUsersData(user)
        XCTAssertTrue(mockDisplay.displayUserDataCalled)
    }
}

class MockUserDetailsDisplayLogic: UserDetailsDisplayLogic {
    
    var displayUserDataCalled = false
    
    func displayUserData(model: UsersDetailsModel, title: String) {
        displayUserDataCalled = true
    }
}
