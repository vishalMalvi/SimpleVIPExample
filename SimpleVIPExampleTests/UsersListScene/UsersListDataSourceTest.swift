//
//  UsersListDataSourceTest.swift
//  SimpleVIPExampleTests
//
//  Created by Vishal_Malvi on 04/01/23.
//

import XCTest
@testable import SimpleVIPExample

final class UsersListDataSourceTest: XCTestCase {
    
    var dataSource: UsersListDataSource!
    var mockTableView: UITableView!
    
    override func setUp() {
        super.setUp()
        let user1 = User(userId: 1, firstName: "TestName1", lastName: "TestLastName1", phoneNumber: "1234567890", emailAddress: "Test1@gmail.com")
        let user2 = User(userId: 2, firstName: "TestName2", lastName: "TestLastName2", phoneNumber: "1234567890", emailAddress: "Test2@gmail.com")
        dataSource = UsersListDataSource([user1, user2])
        mockTableView = UITableView()
        mockTableView.dataSource = dataSource
        dataSource.registerCells(mockTableView)
        dataSource.tableView(mockTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
    }
    
    override func tearDown() {
        super.tearDown()
        dataSource = nil
        mockTableView = nil
    }
    
}

extension UsersListDataSourceTest {
    
    func testInit() {
        XCTAssertNotNil(dataSource)
        XCTAssertNotNil(mockTableView)
    }
    
    func testNumberOfRowInSection() {
        XCTAssertEqual(dataSource.tableView(mockTableView, numberOfRowsInSection: 0), 2)
    }
    
    func testCellForRowAt() {
        XCTAssertTrue(dataSource.tableView(mockTableView, cellForRowAt: IndexPath(row: 0, section: 0)) is UsersTableViewCell)
    }
}
