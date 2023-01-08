//
//  UsersListViewController.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import UIKit

class UsersListViewController: UIViewController {
    
    var interactor: UsersListBusinessLogic?
    var dataSource: UsersListDataSource?
    var router: UsersListRoutingLogic?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.clipsToBounds = true
        tableView.alwaysBounceVertical = false
        tableView.register(UsersTableViewCell.self, forCellReuseIdentifier: UsersListCells.usersTableViewCell.rawValue)
        return tableView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        interactor?.requestUsersData()
    }
}

// MARK: - UsersDataDisplayLogic
extension UsersListViewController: UsersListDisplayLogic {
    
    func displayUsersData(usersDataSource: UsersListDataSource, title: String) {
        navigationItem.title = title
        dataSource = usersDataSource
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        dataSource?.delegate = self
        reloadTableView()
    }
}

// MARK: - Helping Methods
extension UsersListViewController {
    
    private func setupView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                               constant: ViewDimensionConstants.zero.rawValue),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: -ViewDimensionConstants.zero.rawValue),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: ViewDimensionConstants.zero.rawValue),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                              constant: -ViewDimensionConstants.zero.rawValue)
        ])
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - UsersDataSourceDelegate
extension UsersListViewController : UsersListDataSourceDelegate {
    
    func selectedUser(_ user: User) {
        router?.navigateToUserDetailsController(user)
    }
}
