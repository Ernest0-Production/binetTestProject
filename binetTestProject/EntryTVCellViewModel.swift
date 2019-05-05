//
//  EntryTVCellViewModel.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import Foundation

class EntryTVCellViewModel {
    private let model: Entry
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return formatter
    }()
    
    var entryBody: String {
        let body = model.text
        if body.count <= 200 {
            return body
        } else {
            return String(body[...body.index(body.startIndex, offsetBy: 200)])
        }
    }

    var createDate: String {
        return "дата создания\n\(dateFormatter.string(from: model.createDate))"
    }
    
    var modifyDate: String {
        if model.createDate != model.modifyDate {
            return "дата изменения\n\(dateFormatter.string(from: model.modifyDate))"
        }
        return ""
    }
    
    init(entry: Entry) {
        model = entry
    }
}
