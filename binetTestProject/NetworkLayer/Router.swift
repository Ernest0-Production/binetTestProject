//
//  EndPoint.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import Foundation

enum Router {
    case createSession
    case getEntries
    case addEntry(text: String)
    
    private static let baseURL = "https://bnet.i-partner.ru/testAPI/"
    private static let token = "eALnFYZ-E3-rKhiuHv"
    
    private enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        //...
    }

    private var method: HTTPMethod {
        return .post
    }
    
    private var headers: String {
        switch self {
        case.createSession:
            return "a=new_session"
        case .getEntries:
            return "a=get_entries&session=\(NetworkManager.shared.sessionID ?? "")"
        case .addEntry(let text):
            return "a=add_entry&session=\(NetworkManager.shared.sessionID ?? "")&body=\(text)"
        }
    }
    
    
    func request() throws -> URLRequest {
        guard let url = URL(string: Router.baseURL) else { throw NetworkError.badURL }
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.addValue(Router.token, forHTTPHeaderField: "token")
        request.httpBody = headers.data(using: .utf8)
        
        return request
    }
}
