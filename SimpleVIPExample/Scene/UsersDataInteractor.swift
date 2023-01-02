//
//  UsersDataInteractor.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import UIKit

class UsersDataInteractor: UsersDataBusinessLogic {
    
    var presenter: UsersDataPresentationLogic?
    
    func requestUsersData() {
        Requests.getUsersData { [weak self] result in
            switch result {
            case .success(let usersData):
                self?.presenter?.presentUsersData(usersData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
