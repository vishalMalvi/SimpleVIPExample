//
//  UserDetailsInteractorTest.swift
//  SimpleVIPExampleTests
//
//  Created by Vishal_Malvi on 04/01/23.
//

import XCTest
@testable import SimpleVIPExample

final class UserDetailsInteractorTest: XCTestCase {
    
    var interactor: UserDetailsInteractor!
    var presenter: MockUserDetailsPresentationLogic!
    
    override func setUp() {
        super.setUp()
        interactor = UserDetailsInteractor()
        presenter = MockUserDetailsPresentationLogic()
        interactor.presenter = presenter
    }
    
    override func tearDown() {
        super.tearDown()
        interactor = nil
        presenter = nil
    }
    
    func testInteractor() {
        interactor.setupUserDetails(User(userId: 1, firstName: "TestName", lastName: "TestLastName", phoneNumber: "1234567890", emailAddress: "Test@gmail.com"))
        XCTAssertTrue(presenter.presentUserDataCalled)
    }
}

class MockUserDetailsPresentationLogic: UserDetailsPresentationLogic {
    
    var presentUserDataCalled = false
    
    func presentUsersData(_ user: SimpleVIPExample.User) {
        presentUserDataCalled = true
    }
}
