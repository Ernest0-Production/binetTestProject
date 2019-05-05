//
//  NetworkError.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import Foundation


enum NetworkError: LocalizedError {
    case badResponce
    case requestError(_ error: Error)
    case notData
    case badURL
    case notHeader
    case notSession
    case invalidToken
    case invalidSession
    case notFoundEntry
    case unknown(description: String)
    
    init (_ stringValue: String) {
        switch stringValue {
            case "unspecified header 'token'":  self = .notHeader
            case "unspecified field 'session'": self = .notSession
            case "invalid token":               self = .invalidToken
            case "Entry not found":             self = .notFoundEntry
            case "invalid session":             self = .invalidSession
            default:                            self = .unknown(description: stringValue)
        }
    }
    
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "Невалидный URL"
        case .notData:
            return  "Отсуствуют данные"
        case .requestError(let error):
            return "Ошибка запроса:\(error.localizedDescription)"
        case .badResponce:
            return "Нет подключения к сети"
        case .notHeader:
            return "Не передан заголовок token"
        case .notSession:
            return "Не передан параметр session"
        case .invalidToken:
            return "Неправильный token (отсутствует в базе данных)"
        case .notFoundEntry:
            return "Запись с такими параметрами не найдена"
        case .invalidSession:
            return "Невалидная сессия"
        case .unknown(let description):
            return "Неизместна ошибка:\(description)"
        }
    }
}
