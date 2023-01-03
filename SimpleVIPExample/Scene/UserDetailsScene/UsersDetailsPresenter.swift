//
//  UsersDetailsPresenter.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 03/01/23.
//

import UIKit

class UsersDetailsPresenter: UserDetailsPresentationLogic {
    
    weak var viewController: UserDetailsDisplayLogic?
    
    func presentUsersData(_ user: User) {
        let model = UsersDetailsModel(name: user.fullName(), phoneNumber: user.phoneNumber, emailAddress: user.emailAddress)
        viewController?.displayUserData(model: model, title: StringConstant.userDetails.rawValue)
    }
}
