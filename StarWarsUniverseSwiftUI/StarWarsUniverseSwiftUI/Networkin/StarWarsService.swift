//
//  StarWarsService.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

protocol StarWarsServiceProtocol {
    func fetchData<T: Codable>(type: T, by urlString: String, completion: @escaping (_ result: Result<T, ApiError>) -> Void) async
}

final class StarWarsService: StarWarsServiceProtocol {
    
    static let shared: StarWarsServiceProtocol = StarWarsService()
    
    func fetchData<T: Codable>(
        type: T,
        by urlString: String,
        completion: @escaping (_ result: Result<T, ApiError>) -> Void
    ) async {
        guard
            let request = ApiRequest.defaultAPI(urlString: urlString).request
        else {
            completion(.failure(ApiError.message("Wrong REQUEST!!!")))
            return
        }
        
        await NetworkRequestManager.shared.request(type: type, request: request, completion: completion)
    }
}
