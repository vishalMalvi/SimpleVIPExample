//
//  EndPoint.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 12/02/23.
//

import Foundation

public typealias HTTPHeaders = [String: String]

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPoint {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPMethods { get }
    var headers: HTTPHeaders? { get }
}
