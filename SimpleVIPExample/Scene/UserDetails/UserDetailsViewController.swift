//
//  UserDetailsViewController.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 03/01/23.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
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
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = IntegerConstants.zero.rawValue
        return label
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = IntegerConstants.zero.rawValue
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = IntegerConstants.zero.rawValue
        return label
    }()
    
    var interactor: UserDetailsBusinessLogic?
    var user: User
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        interactor?.setupUserDetails(user)
    }
    
}

// MARK: - UserDetailsDisplayLogic
extension UserDetailsViewController: UserDetailsDisplayLogic {
    func displayUserData(model: UsersDetailsModel, title: String) {
        navigationItem.title  = title
        nameLabel.text = model.name
        phoneLabel.text = model.phoneNumber
        emailLabel.text = model.emailAddress
    }
}

// MARK: - Helping Methods
extension UserDetailsViewController {
    
    private func setupView() {
        view.addSubview(containerVStack)
        NSLayoutConstraint.activate([
            containerVStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                     constant: ViewDimensionConstants.sixteen.rawValue),
            containerVStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                      constant: -ViewDimensionConstants.sixteen.rawValue),
            containerVStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                 constant: ViewDimensionConstants.sixteen.rawValue)
        ])
        containerVStack.addArrangedSubview(nameLabel)
        containerVStack.addArrangedSubview(phoneLabel)
        containerVStack.addArrangedSubview(emailLabel)
    }
}
