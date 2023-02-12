//
//  ProductsPresenter.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 12/02/23.
//

import Foundation

class ProductsPresenter: ProductsPresentationLogic {
    
    // MARK: - Properties
    weak var viewController: ProductsDisplayLogic?
    
    func presentProductsData(_ products: [Product]) {
        let dataSource = ProductsDataSource(products)
        viewController?.displayProducts(productsDataSource: dataSource)
    }
    
    func updateActivityIndicator(status: IndicatorStatus) {
        viewController?.updateActivityIndicatorInProductsPage(status: status)
    }
    
}
