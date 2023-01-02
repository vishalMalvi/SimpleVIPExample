//
//  UsersDataPresenter.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import UIKit

class UsersDataPresenter: UsersDataPresentationLogic {
    
    weak var viewController: UsersDataDisplayLogic?
    
    func presentUsersData(_ usersData: UsersData) {
        guard let users = usersData.users, let title = usersData.title else { return }
        let dataSource = UsersDataSource(users)
        viewController?.displayUsersData(usersDataSource: dataSource, title: title)
    }
}
