//
//  NetworkRequestManager.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation
import SwiftUI

protocol NetworkRequestManagerProtocol {
    func request<T: Codable>(type: T, request: URLRequest, completion: @escaping (Result<T, ApiError>) -> Void) async
}

class NetworkRequestManager: NetworkRequestManagerProtocol {
    
    static var shared: NetworkRequestManagerProtocol = NetworkRequestManager()
    
    private init() { }
    
    func request<T: Codable>(
        type: T,
        request: URLRequest,
        completion: @escaping (Result<T, ApiError>) -> Void
    ) async {
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let response = response as? HTTPURLResponse,
               (400...500).contains(response.statusCode) {
                completion(.failure(.response(response.statusCode)))
            }
            
            let json = try JSONDecoder().decode(T.self, from: data)
            completion(.success(json))
        }
        catch {
            completion(.failure(.wrongType(String(describing: T.self))))
        }
    }
}
