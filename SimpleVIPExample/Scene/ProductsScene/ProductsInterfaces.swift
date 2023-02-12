//
//  ProductsInterfaces.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 12/02/23.
//

import Foundation

protocol ProductsBusinessLogic {
    func requestProducts()
}

protocol ProductsPresentationLogic {
    func presentProductsData(_ products: [Product])
    func updateActivityIndicator(status: IndicatorStatus)
}

protocol ProductsDisplayLogic: AnyObject {
    func displayProducts(productsDataSource: ProductsDataSource)
    func updateActivityIndicatorInProductsPage(status: IndicatorStatus)
}

protocol ProductsRoutingLogic {
    func navigateToProductDetailsController(_ product: Product)
}

protocol ProductsDataSourceDelegate: AnyObject {
    func selectedProduct(_ product: Product)
}
