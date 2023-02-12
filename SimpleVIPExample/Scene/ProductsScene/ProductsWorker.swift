//
//  ProductsWorker.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 12/02/23.
//

import Foundation

typealias ProductResult = Result<[Product], CustomErrors>

class ProductsWorker {
    
    func getProducts(completion: @escaping (ProductResult) -> Void) {
        APIManager.shared.request (
            modelType: [Product].self,
            type: ProductEndPoint.getProducts) { result in
                switch result {
                case .success(let products):
                    completion(.success(products))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
