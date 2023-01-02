//
//  UsersTableViewCell.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    struct Layout {
        var topPadding: CGFloat = ViewDimensionConstants.sixteen.rawValue
        var bottomPadding: CGFloat = ViewDimensionConstants.sixteen.rawValue
        var leftPadding: CGFloat = ViewDimensionConstants.sixteen.rawValue
        var rightPadding: CGFloat = ViewDimensionConstants.sixteen.rawValue
        
        init(topPadding: CGFloat = ViewDimensionConstants.sixteen.rawValue,
             bottomPadding: CGFloat = -ViewDimensionConstants.sixteen.rawValue,
             leftPadding: CGFloat = ViewDimensionConstants.sixteen.rawValue,
             rightPadding: CGFloat = -ViewDimensionConstants.sixteen.rawValue) {
            self.topPadding = topPadding
            self.bottomPadding = bottomPadding
            self.leftPadding = leftPadding
            self.rightPadding = rightPadding
        }
    }
    
    struct ViewModel {
        var name: String?
        var email: String?
    }
    
    private lazy var containerVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = ViewDimensionConstants.eight.rawValue
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = IntegerConstants.zero.rawValue
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = IntegerConstants.zero.rawValue
        return label
    }()
    
    var topConstraint: NSLayoutConstraint?
    var bottomConstraint: NSLayoutConstraint?
    var leftConstraint: NSLayoutConstraint?
    var rightConstraint: NSLayoutConstraint?
    var layout = Layout()
    
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
extension UsersTableViewCell {
    
    private func setupUI() {
        
        contentView.addSubview(containerVStack)
        
        leftConstraint = containerVStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: layout.leftPadding)
        leftConstraint?.isActive = true
        
        rightConstraint = containerVStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: layout.rightPadding)
        rightConstraint?.isActive = true
        
        topConstraint = containerVStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: layout.topPadding)
        topConstraint?.isActive = true
        
        bottomConstraint = containerVStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: layout.bottomPadding)
        bottomConstraint?.isActive = true
        
        containerVStack.addArrangedSubview(nameLabel)
        containerVStack.addArrangedSubview(emailLabel)
    }
    
    func updateLayout(
        topPadding: CGFloat = ViewDimensionConstants.sixteen.rawValue,
        bottomPadding: CGFloat = -ViewDimensionConstants.sixteen.rawValue,
        leftPadding: CGFloat = ViewDimensionConstants.sixteen.rawValue,
        rightPadding: CGFloat = -ViewDimensionConstants.sixteen.rawValue) {
            layout = Layout(topPadding: topPadding, bottomPadding: bottomPadding, leftPadding: leftPadding, rightPadding: rightPadding)
            topConstraint?.constant = layout.topPadding
            bottomConstraint?.constant = layout.bottomPadding
            leftConstraint?.constant = layout.leftPadding
            rightConstraint?.constant = layout.rightPadding
        }
}

// MARK: - Helping Methods for setup data
extension UsersTableViewCell {
    
    func updateData( _ model: ViewModel) {
        nameLabel.text = model.name
        emailLabel.text = model.email
    }
}
