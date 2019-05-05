//
//  Response.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import Foundation

struct Response<Data:Codable>: Codable {
    let status: Int
    let data: Data?
    let error: String?
    enum CodingKeys: CodingKey {
        case status, data, error
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(Int.self, forKey: .status)
        data = try? container.decode(Data.self, forKey: .data)
        error = try? container.decode(String.self, forKey: .error)
        if data == nil && error == nil {
            throw NetworkError.unknown(description: "Не удалось сериализовать ответ")
        }
    }
}
