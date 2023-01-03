//
//  UsersListInteractor.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import UIKit

class UsersListInteractor: UsersListBusinessLogic {
    
    var presenter: UsersListPresentationLogic?
    var worker: UsersListWorker?
    func requestUsersData() {
        worker?.getUsersData { [weak self] result in
            switch result {
            case .success(let usersData):
                self?.presenter?.presentUsersData(usersData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
