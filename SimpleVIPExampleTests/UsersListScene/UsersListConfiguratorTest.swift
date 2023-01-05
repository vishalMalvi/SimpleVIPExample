//
//  UsersListConfiguratorTest.swift
//  SimpleVIPExampleTests
//
//  Created by Vishal_Malvi on 04/01/23.
//

import XCTest
@testable import SimpleVIPExample

final class UsersListConfiguratorTest: XCTestCase {
    
    var viewController: UsersListViewController?
    
    override func setUp() {
        super.setUp()
        viewController = UsersListConfigurator.createScene()
    }
    
    override func tearDown() {
        viewController = nil
    }
    
    func testCreateScene() {
        XCTAssertNotNil(viewController)
    }
}
