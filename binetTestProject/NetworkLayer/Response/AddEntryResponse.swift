//
//  AddEntryResponse.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import Foundation

struct AddEntryResponse: Codable {
    let id: String
    
    enum CodingKeys: CodingKey {
        case id
    }
}
