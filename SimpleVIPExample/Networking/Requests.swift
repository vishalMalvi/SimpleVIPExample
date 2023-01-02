//
//  Requests.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import Foundation

enum EndPoint: String {
    case usersData
}

struct Requests {
    
   static func getUsersData(completion: @escaping (Result<UsersData, Error>) -> Void) {
       if  let url = Bundle.main.url(forResource: EndPoint.usersData.rawValue, withExtension: StringConstant.json.rawValue) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(UsersData.self, from: data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
