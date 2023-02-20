//
//  UsersDetailsPresenter.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 03/01/23.
//

import UIKit

class ProductDetailsPresenter: ProductDetailsPresentationLogic {
    // MARK: - Properties
    weak var viewController: ProductDetailsDisplayLogic?
    
    func presentProductDetailsData(_ product: Product) {
        viewController?.displayProductDetails(product)
    }
}
