//
//  APIManager.swift
//  Virgin Money Staff
//
//  Created by apple on 01/08/2022.
//

import Foundation

protocol APIManager {
    func call<T:Codable>(url: URL?, decoding: T.Type, completion: @escaping (Result<T, RequestErrors>)->())
}

enum RequestErrors: Error {
    case badURL
    case dataNotFound
    case badData
    case jsonParsingFailed
    case badResponse
}

final class RealAPIManager: APIManager {
    
    let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func call<T:Codable>(url: URL?, decoding: T.Type, completion: @escaping (Result<T, RequestErrors>)->()) {
        
        guard let url = url else {
            completion(.failure(RequestErrors.badURL))
            return
        }
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(.failure(RequestErrors.dataNotFound))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(RequestErrors.badResponse))
                return
            }
            guard let data = data else {
                completion(.failure(RequestErrors.badData))
                return
            }
                        
            do {
                let jsonResult = try JSONDecoder().decode(decoding, from: data)
                
                completion(.success(jsonResult))
                
            } catch {
                completion(.failure(RequestErrors.jsonParsingFailed))
            }
        }
        task.resume()
    }
}
