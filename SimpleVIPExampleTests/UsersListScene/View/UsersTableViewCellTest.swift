//
//  UsersTableViewCellTest.swift
//  SimpleVIPExampleTests
//
//  Created by Vishal_Malvi on 04/01/23.
//

import XCTest
@testable import SimpleVIPExample

final class UsersTableViewCellTest: XCTestCase {
    
    var cell: UsersTableViewCell?
    
    override func setUp() {
        super.setUp()
        cell = UsersTableViewCell(style: .default, reuseIdentifier: UsersListCells.usersTableViewCell.rawValue)
    }
    
    override func tearDown() {
        super.tearDown()
        cell = nil
    }
    
    func testCell() {
        cell?.updateData(UsersTableViewCell.ViewModel(name: "TestName", email: "Test@gmail.com"))
        cell?.updateLayout()
    }
}
