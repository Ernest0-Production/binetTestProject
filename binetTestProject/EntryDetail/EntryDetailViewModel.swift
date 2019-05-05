//
//  EntityDetailViewModel.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import Foundation

class EntryDetailViewModel {
    private let model: Entry
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM hh:mm"
        formatter.locale = Locale(identifier: "RU")
        return formatter
    }()
    
    var entryBody: String {
        return model.text
    }
    
    var createDate: String {
        return "дата создания: \(dateFormatter.string(from: model.createDate))"
    }
    
    var modifyDate: String {
        if model.createDate != model.modifyDate {
            return "дата изменения: \(dateFormatter.string(from: model.modifyDate))"
        }
        return ""
    }
    
    
    init(entry: Entry) {
        model = entry
    }
}
