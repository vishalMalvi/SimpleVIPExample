//
//  Users.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import Foundation

struct UsersData: Decodable {
    var users: [User]?
    var title: String?
}

struct User: Decodable {
    var userId: Int?
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    var emailAddress: String?
    
    func fullName() -> String? {
        guard let firstName = firstName, let lastName = lastName  else { return nil }
        return "\(firstName) \(lastName)"
    }
}
