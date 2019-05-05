//
//  Entry.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import Foundation

struct Entry {
    let id: String
    var text: String
    let createDate: Date
    var modifyDate: Date
}

extension Entry: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case text = "body"
        case createDate = "da"
        case modifyDate = "dm"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        text = try container.decode(String.self, forKey: .text)
        createDate = Entry.convertToDate(timeInterval: try container.decode(String.self, forKey: .createDate))!
        modifyDate = Entry.convertToDate(timeInterval: try container.decode(String.self, forKey: .modifyDate))!
    }
    
    private static func convertToDate(timeInterval: String) -> Date? {
        guard let timeInterval = Double(timeInterval) else { return nil }
        return Date(timeIntervalSince1970: timeInterval)
    }
}
