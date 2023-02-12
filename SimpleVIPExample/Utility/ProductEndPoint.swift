//
//  ProductEndPoint.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 12/02/23.
//

import Foundation

enum ProductEndPoint {
    case getProducts // Right now, I am implementing get functionality only if want we can add more cases
}

extension ProductEndPoint: EndPoint {
    
    var path: String {
        StringConstant.products.rawValue
    }
    
    var baseURL: String {
        API.baseURl
    }
    
    var url: URL? {
        URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        .get
    }
    
    var headers: HTTPHeaders? {
        APIManager.sharedHeaders
    }
}
