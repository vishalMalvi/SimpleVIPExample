//
//  UsersListRouter.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 03/01/23.
//

import UIKit

class UsersListRouter: UsersListRoutingLogic {
    
    weak var viewController: UsersListViewController?
    
    func navigateToUserDetailsController(_ user: User) {
        let vc = UserDetailsConfigurator.createScene(user: user)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
