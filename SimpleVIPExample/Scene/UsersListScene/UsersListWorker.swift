//
//  UsersListWorker.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 04/01/23.
//

import Foundation

enum EndPoint: String {
    case usersList
}

typealias RequestResult = Result<UsersList, Error>

class UsersListWorker {
    func getUsersData(completion: @escaping (RequestResult) -> Void) {
        if  let url = Bundle.main.url(forResource: EndPoint.usersList.rawValue, withExtension: StringConstant.json.rawValue) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(UsersList.self, from: data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
