//
//  UserDetailsViewController.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 03/01/23.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    // MARK: - Component
    private lazy var containerVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = ViewDimensionConstants.sixteen.rawValue
        return stackView
    }()
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = ViewDimensionConstants.ten.rawValue
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = .label
        label.numberOfLines = IntegerConstants.zero.rawValue
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        label.numberOfLines = IntegerConstants.zero.rawValue
        return label
    }()
    
    // MARK: - Properties
    var interactor: ProductDetailsBusinessLogic?
    var product: Product
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = StringConstant.productsDetails.rawValue
        setupView()
        interactor?.setupProductDetails(product)
    }
    
}

// MARK: - UserDetailsDisplayLogic
extension ProductDetailsViewController: ProductDetailsDisplayLogic {
    
    func displayProductDetails(_ product: Product) {
        titleLabel.text = product.title
        descLabel.text = product.description
        productImageView.setImage(with: product.image)
    }
}

// MARK: - Helping Methods
extension ProductDetailsViewController {
    
    private func setupView() {
        view.addSubview(containerVStack)
        NSLayoutConstraint.activate([
            containerVStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                     constant: ViewDimensionConstants.sixteen.rawValue),
            containerVStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                      constant: -ViewDimensionConstants.sixteen.rawValue),
            containerVStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                 constant: ViewDimensionConstants.sixteen.rawValue),
            productImageView.widthAnchor.constraint(equalToConstant: ViewDimensionConstants.twoHundred.rawValue),
            productImageView.heightAnchor.constraint(equalToConstant: ViewDimensionConstants.twoHundred.rawValue)
        ])
        containerVStack.addArrangedSubview(productImageView)
        containerVStack.addArrangedSubview(titleLabel)
        containerVStack.addArrangedSubview(descLabel)
    }
}
