//
//  ProductsDataSource.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 12/02/23.
//

import UIKit

enum ProductsCells: String {
    case productTableViewCell
}

class ProductsDataSource: NSObject {
    
    // MARK: - Properties
    var products: [Product]
    weak var delegate: ProductsDataSourceDelegate?
    
    // MARK: - init
    init(_ products: [Product]) {
        self.products = products
    }
    
}

// MARK: - UITableViewDataSource
extension ProductsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductsCells.productTableViewCell.rawValue) as? ProductTableViewCell  else { return UITableViewCell() }
        let product = products[indexPath.row]
        let model = ProductTableViewCell.ViewModel(title: product.title, description: product.description, image: product.image)
        cell.updateData(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ViewDimensionConstants.oneHundredThirtyTwo.rawValue
    }
}

// MARK: - UITableViewDelegate
extension ProductsDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        delegate?.selectedProduct(product)
    }
}
