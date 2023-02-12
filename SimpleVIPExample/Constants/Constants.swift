//
//  Constants.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 02/01/23.
//

import Foundation

enum ViewDimensionConstants: CGFloat  {
    case zero = 0
    case eight = 8.0
    case ten = 10.0
    case fifteen = 15.0
    case sixteen = 16.0
    case hundred = 100.0
    case oneHundredThirtyTwo = 132.0
    case twoHundred = 200.0
}

enum IntegerConstants: Int {
    case zero =  0
    case one = 1
    case two = 2
    case three = 3
    case twoHundred = 200
    case twoHundredNinetyNine  = 299
}

enum StringConstant: String {
    case products = "Products"
    case productsDetails = "Products Details"
}

enum API {
    static let baseURl = "https://fakestoreapi.com/"
}
