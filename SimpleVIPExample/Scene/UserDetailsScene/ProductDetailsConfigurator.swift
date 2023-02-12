//
//  UserDetailsConfigurator.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 03/01/23.
//

import UIKit



struct ProductDetailsConfigurator {
    
    static func createScene(product: Product) -> ProductDetailsViewController {
        let viewController = ProductDetailsViewController(product: product)
        let presenter = ProductDetailsPresenter()
        let interactor = ProductDetailsInteractor()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        return viewController
    }
}

