//
//  APIManager.swift
//  SimpleVIPExample
//
//  Created by Vishal_Malvi on 12/02/23.
//

import Foundation

typealias RequestResult<T> = (Result<T, CustomErrors>) -> Void

final class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    static var sharedHeaders : HTTPHeaders {
        ["Content-Type": "application/json"]
    }
    
    func request<T: Codable>(modelType: T.Type, type: EndPoint, completion: @escaping RequestResult<T>) {
        
        guard let url = type.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = type.method.rawValue
        
        request.allHTTPHeaderFields = type.headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            do {
                let model = try JSONDecoder().decode(modelType, from: data)
                completion(.success(model))
            }catch {
                completion(.failure(.network(error)))
            }
            
        }.resume()
    }
}
