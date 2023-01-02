//
//  UsersDataSource.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import UIKit

enum UsersDataCells: String {
    case usersTableViewCell
}

class UsersDataSource: NSObject {
    
    var users: [User]
    
    init(_ users: [User]) {
        self.users = users
    }
}

// MARK: - UITableViewDataSource
extension UsersDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UsersDataCells.usersTableViewCell.rawValue) as? UsersTableViewCell  else { return UITableViewCell() }
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
extension UsersDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("getting called")
    }
}


// MARK: - Helping Methods
extension UsersDataSource {
    
    func registerCells(_ tableView: UITableView) {
        tableView.register(UsersTableViewCell.self, forCellReuseIdentifier: UsersDataCells.usersTableViewCell.rawValue)
    }
}
