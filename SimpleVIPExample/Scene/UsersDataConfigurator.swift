//
//  UsersDataConfigurator.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import UIKit

struct UsersDataConfigurator {
    
    static func createScene() -> UsersDataViewController {
        let viewController = UsersDataViewController()
        let presenter = UsersDataPresenter()
        let interactor = UsersDataInteractor()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        return viewController
    }
}
