//
//  NetworkManager.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let session = URLSession.shared
    var sessionID: String? {
        return UserDefaults.standard.value(forKey: "sessionID") as? String
    }
    
    private init() {}
    
    func request<T: Codable>(router: Router, completion: @escaping (Result<T, Error>) -> Void) {
        do {
            let task = try session.dataTask(with: router.request()) { (data, response, error) in
                if let error = error {
                    completion(.failure(NetworkError.requestError(error)))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                    completion(.failure(NetworkError.badResponce))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NetworkError.notData))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(Response<T>.self, from: data)
                    if let responseError = result.error {
                        completion(.failure(NetworkError(responseError)))
                    } else if let responseData = result.data {
                        completion(.success(responseData))
                    }
                } catch let error {
                    completion(.failure(error))
                }
            }
            task.resume()
            
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func createSession(completion: @escaping (String?, Error?) -> ()) {
        request(router: .createSession) { (result: Result<CreateSessionResponse,Error>) in
            switch result {
            case .failure(let error):
                completion(nil, error)
            case .success(let response):
                UserDefaults.standard.set(response.session, forKey: "sessionID")
                completion(response.session, nil)
            }
        }
    }
}
