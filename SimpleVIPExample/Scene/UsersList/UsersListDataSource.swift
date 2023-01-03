//
//  UsersListDataSource.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import UIKit

enum UsersListCells: String {
    case usersTableViewCell
}

class UsersListDataSource: NSObject {
    
    var users: [User]
    weak var delegate: UsersListDataSourceDelegate?
    
    init(_ users: [User]) {
        self.users = users
    }
}

// MARK: - UITableViewDataSource
extension UsersListDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UsersListCells.usersTableViewCell.rawValue) as? UsersTableViewCell  else { return UITableViewCell() }
        let user = users[indexPath.row]
        let model = UsersTableViewCell.ViewModel(name: user.fullName(), email: user.emailAddress)
        cell.updateData(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDelegate
extension UsersListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        delegate?.selectedUser(user)
    }
}


// MARK: - Helping Methods
extension UsersListDataSource {
    
    func registerCells(_ tableView: UITableView) {
        tableView.register(UsersTableViewCell.self, forCellReuseIdentifier: UsersListCells.usersTableViewCell.rawValue)
    }
}
