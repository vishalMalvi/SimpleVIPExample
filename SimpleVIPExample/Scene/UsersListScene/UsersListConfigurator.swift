//
//  UsersListConfigurator.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import UIKit

struct UsersListConfigurator {
    
    static func createScene() -> UsersListViewController {
        let viewController = UsersListViewController()
        let presenter = UsersListPresenter()
        let interactor = UsersListInteractor()
        let router = UsersListRouter()
        let worker = UsersListWorker()
        viewController.interactor = interactor
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        viewController.router = router
        router.viewController = viewController
        return viewController
    }
}
