//
//  UsersDataInterfaces.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import Foundation

protocol UsersDataBusinessLogic {
    func requestUsersData()
}

protocol UsersDataPresentationLogic {
    func presentUsersData(_ usersData: UsersData)
}

protocol UsersDataDisplayLogic: AnyObject {
    func displayUsersData(usersDataSource: UsersDataSource, title: String)
}
