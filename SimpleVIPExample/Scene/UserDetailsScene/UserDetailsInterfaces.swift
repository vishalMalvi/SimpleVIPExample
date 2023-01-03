//
//  UserDetailsInterfaces.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 03/01/23.
//

import Foundation

protocol UserDetailsBusinessLogic {
    func setupUserDetails(_ user: User)
}

protocol UserDetailsPresentationLogic {
    func presentUsersData(_ user: User)
}

protocol UserDetailsDisplayLogic: AnyObject {
    func displayUserData(model: UsersDetailsModel, title: String)
}
