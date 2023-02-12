//
//  CustomErrors.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 12/02/23.
//

import Foundation

enum CustomErrors: Error  {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

// Uncomment it to pass LocalizedError

/*
extension CustomErrors: LocalizedError {
    
    public var errorDescription: String? {
        return nil
    }
}
*/
