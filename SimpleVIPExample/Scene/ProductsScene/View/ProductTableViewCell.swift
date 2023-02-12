//
//  ProductTableViewCell.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 12/02/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    // MARK: - Layout
    struct Layout {
        var topPadding: CGFloat = ViewDimensionConstants.eight.rawValue
        var bottomPadding: CGFloat = ViewDimensionConstants.eight.rawValue
        var leftPadding: CGFloat = ViewDimensionConstants.eight.rawValue
        var rightPadding: CGFloat = ViewDimensionConstants.eight.rawValue
        
        init(topPadding: CGFloat = ViewDimensionConstants.eight.rawValue,
             bottomPadding: CGFloat = -ViewDimensionConstants.eight.rawValue,
             leftPadding: CGFloat = ViewDimensionConstants.eight.rawValue,
             rightPadding: CGFloat = -ViewDimensionConstants.eight.rawValue) {
            self.topPadding = topPadding
            self.bottomPadding = bottomPadding
            self.leftPadding = leftPadding
            self.rightPadding = rightPadding
        }
    }
    // MARK: - ViewModel
    struct ViewModel {
        var title: String?
        var description: String?
        var image: String?
    }
    
    // MARK: - Component
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = ViewDimensionConstants.fifteen.rawValue
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var containerHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = ViewDimensionConstants.eight.rawValue
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
    
    private lazy var containerVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = ViewDimensionConstants.eight.rawValue
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .label
        label.numberOfLines = IntegerConstants.two.rawValue
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .secondaryLabel
        label.numberOfLines = IntegerConstants.three.rawValue
        return label
    }()
    
    // MARK: - Properties
    private var topConstraint: NSLayoutConstraint?
    private var bottomConstraint: NSLayoutConstraint?
    private var leftConstraint: NSLayoutConstraint?
    private var rightConstraint: NSLayoutConstraint?
    private var layout = Layout()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.separatorInset = .zero
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Setup
extension ProductTableViewCell {
    
    private func setupUI() {
        contentView.addSubview(containerView)
        leftConstraint = containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: layout.leftPadding)
        leftConstraint?.isActive = true
        
        rightConstraint = containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: layout.rightPadding)
        rightConstraint?.isActive = true
        
        topConstraint = containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: layout.topPadding)
        topConstraint?.isActive = true
        
        bottomConstraint = containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: layout.bottomPadding)
        bottomConstraint?.isActive = true
        
        containerView.addSubview(containerHStack)
        
        NSLayoutConstraint.activate([
            containerHStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: ViewDimensionConstants.eight.rawValue),
            containerHStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -ViewDimensionConstants.eight.rawValue),
            containerHStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: ViewDimensionConstants.eight.rawValue),
            containerHStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -ViewDimensionConstants.eight.rawValue),
            productImageView.widthAnchor.constraint(equalToConstant: ViewDimensionConstants.hundred.rawValue)
        ])
        
        containerHStack.addArrangedSubview(productImageView)
        containerHStack.addArrangedSubview(containerVStack)
        containerVStack.addArrangedSubview(titleLabel)
        containerVStack.addArrangedSubview(descLabel)
    }
    
    func updateLayout(
        topPadding: CGFloat = ViewDimensionConstants.eight.rawValue,
        bottomPadding: CGFloat = -ViewDimensionConstants.eight.rawValue,
        leftPadding: CGFloat = ViewDimensionConstants.eight.rawValue,
        rightPadding: CGFloat = -ViewDimensionConstants.eight.rawValue) {
            layout = Layout(topPadding: topPadding, bottomPadding: bottomPadding, leftPadding: leftPadding, rightPadding: rightPadding)
            topConstraint?.constant = layout.topPadding
            bottomConstraint?.constant = layout.bottomPadding
            leftConstraint?.constant = layout.leftPadding
            rightConstraint?.constant = layout.rightPadding
        }
}

// MARK: - Helping Methods for setup data
extension ProductTableViewCell {
    
    func updateData( _ model: ViewModel) {
        titleLabel.text = model.title
        descLabel.text = model.description
        guard let image = model.image else { return }
        productImageView.setImage(with: image)
    }
}
