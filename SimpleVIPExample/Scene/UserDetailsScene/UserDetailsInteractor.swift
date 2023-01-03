//
//  UserDetailsInteractor.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 03/01/23.
//

import UIKit

class UserDetailsInteractor: UserDetailsBusinessLogic {
    
    var presenter: UserDetailsPresentationLogic?
    
    func setupUserDetails(_ user: User) {
        presenter?.presentUsersData(user)
    }
}
