//
//  ProductsViewController.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 12/02/23.
//

import UIKit

enum IndicatorStatus {
    case start
    case stop
}


class ProductsViewController: UIViewController {
   
    // MARK: - Component
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = false
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductsCells.productTableViewCell.rawValue)
        return tableView
    }()
    
    lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Properties
    var interactor: ProductsBusinessLogic?
    var dataSource: ProductsDataSource?
    var router: ProductsRoutingLogic?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = StringConstant.products.rawValue
        setupView()
        interactor?.requestProducts()
    }
}

// MARK: - ProductsDisplayLogic
extension ProductsViewController: ProductsDisplayLogic {
    
    func displayProducts(productsDataSource: ProductsDataSource) {
        DispatchQueue.main.async {
            self.dataSource = productsDataSource
            self.tableView.dataSource = self.dataSource
            self.tableView.delegate = self.dataSource
            self.dataSource?.delegate = self
            self.tableView.reloadData()
        }
    }
    
    func updateActivityIndicatorInProductsPage(status: IndicatorStatus) {
        DispatchQueue.main.async {
            status == .start ? self.indicatorView.startAnimating() : self.indicatorView.stopAnimating()
        }
    }
}

// MARK: - ProductsDataSourceDelegate
extension ProductsViewController: ProductsDataSourceDelegate {
    func selectedProduct(_ product: Product) {
        router?.navigateToProductDetailsController(product)
    }
}

// MARK: - Helping Methods
extension ProductsViewController {
    
    private func setupView() {
        view.addSubview(tableView)
        view.addSubview(indicatorView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                               constant: ViewDimensionConstants.zero.rawValue),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: -ViewDimensionConstants.zero.rawValue),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: ViewDimensionConstants.zero.rawValue),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                              constant: -ViewDimensionConstants.zero.rawValue),
            indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
