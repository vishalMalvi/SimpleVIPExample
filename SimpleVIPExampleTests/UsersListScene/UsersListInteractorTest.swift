//
//  UsersListInteractorTest.swift
//  SimpleVIPExampleTests
//
//  Created by Vishal_Malvi on 04/01/23.
//

import XCTest
@testable import SimpleVIPExample

final class UsersListInteractorTest: XCTestCase {
    
    var interactor: UsersListInteractor!
    var presenter: MockUsersListPresentationLogic!
    
    override func setUp() {
        super.setUp()
        interactor = UsersListInteractor()
        presenter = MockUsersListPresentationLogic()
        interactor.presenter = presenter
        interactor.worker = UsersListWorker()
    }
    
    override func tearDown() {
        super.tearDown()
        interactor = nil
        presenter = nil
    }
    
    func testInteractor() {
        interactor.requestUsersData()
        XCTAssertTrue(presenter.presentUsersDataCalled)
    }
}

class MockUsersListPresentationLogic: UsersListPresentationLogic {
    
    var presentUsersDataCalled = false
    
    func presentUsersData(_ usersData: UsersList) {
        presentUsersDataCalled = true
    }
}
