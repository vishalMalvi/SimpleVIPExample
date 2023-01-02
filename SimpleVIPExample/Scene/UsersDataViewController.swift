//
//  UsersDataViewController.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import UIKit

class UsersDataViewController: UIViewController {
    
    var interactor: UsersDataBusinessLogic?
    var dataSource: UsersDataSource?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.clipsToBounds = true
        tableView.alwaysBounceVertical = false
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
extension UsersDataViewController: UsersDataDisplayLogic {
    
    func displayUsersData(usersDataSource: UsersDataSource, title: String) {
        navigationItem.title = title
        dataSource = usersDataSource
        dataSource?.registerCells(tableView)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        reloadTableView()
    }
}

// MARK: - Helping Methods
extension UsersDataViewController {
    
    private func setupView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                               constant: ViewDimensionConstants.zero.rawValue),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: ViewDimensionConstants.zero.rawValue),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: ViewDimensionConstants.zero.rawValue),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                              constant: ViewDimensionConstants.zero.rawValue)
        ])
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
