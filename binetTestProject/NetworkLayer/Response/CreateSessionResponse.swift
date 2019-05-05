//
//  CreateSessionResponse.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import Foundation

struct CreateSessionResponse: Codable {
    let session: String
    
    enum CodingsKeys: CodingKey {
        case session
    }
}
