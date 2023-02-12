//
//  UserDetailsInteractor.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 03/01/23.
//

import UIKit

class ProductDetailsInteractor: ProductDetailsBusinessLogic {
    // MARK: - Properties
    var presenter: ProductDetailsPresentationLogic?
    
    func setupProductDetails(_ product: Product) {
        presenter?.presentProductDetailsData(product)
    }
}
