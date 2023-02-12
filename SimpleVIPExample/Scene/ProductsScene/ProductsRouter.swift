//
//  ProductsRouter.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 12/02/23.
//

import UIKit

class ProductsRouter: ProductsRoutingLogic {
    // MARK: - Properties
    weak var viewController: ProductsViewController?
    
    func navigateToProductDetailsController(_ product: Product) {
        let vc = ProductDetailsConfigurator.createScene(product: product)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
