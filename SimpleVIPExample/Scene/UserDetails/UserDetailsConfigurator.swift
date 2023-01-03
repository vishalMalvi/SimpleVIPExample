//
//  UserDetailsConfigurator.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 03/01/23.
//

import UIKit

struct UserDetailsConfigurator {
    
    static func createScene(user: User) -> UserDetailsViewController {
        let viewController = UserDetailsViewController(user: user)
        let presenter = UsersDetailsPresenter()
        let interactor = UserDetailsInteractor()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        return viewController
    }
}

