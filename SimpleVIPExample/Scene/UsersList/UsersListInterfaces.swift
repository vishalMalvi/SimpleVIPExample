//
//  UsersDataInterfaces.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import Foundation

protocol UsersListBusinessLogic {
    func requestUsersData()
}

protocol UsersListPresentationLogic {
    func presentUsersData(_ usersData: UsersList)
}

protocol UsersListDisplayLogic: AnyObject {
    func displayUsersData(usersDataSource: UsersListDataSource, title: String)
}

protocol UsersListRoutingLogic {
    func navigateToUserDetailsController(_ user: User)
}

protocol UsersListDataSourceDelegate: AnyObject {
    func selectedUser(_ user: User)
}
