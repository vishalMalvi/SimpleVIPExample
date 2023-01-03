//
//  UsersDataPresenter.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import UIKit

class UsersListPresenter: UsersListPresentationLogic {
    
    weak var viewController: UsersListDisplayLogic?
    
    func presentUsersData(_ usersData: UsersList) {
        guard let users = usersData.users, let title = usersData.title else { return }
        let dataSource = UsersListDataSource(users)
        viewController?.displayUsersData(usersDataSource: dataSource, title: title)
    }
}
