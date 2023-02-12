//
//  ProductsInteractor.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 12/02/23.
//

import Foundation

class ProductsInteractor: ProductsBusinessLogic  {
    // MARK: - Properties
    var presenter: ProductsPresentationLogic?
    var worker: ProductsWorker?
    
    func requestProducts() {
        presenter?.updateActivityIndicator(status: .start)
        worker?.getProducts(completion: { [weak self] result in
            self?.presenter?.updateActivityIndicator(status: .stop)
            switch result {
            case .success(let products):
                print(products)
                self?.presenter?.presentProductsData(products)
            case .failure(let error):
                print(error)
            }
        })
    }
}
