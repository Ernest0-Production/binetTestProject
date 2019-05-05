//
//  Observable.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import Foundation

class Observable<T> {
    typealias Listener = (T) -> Void
    private var listeners = [Listener]()
    var value: T {
        didSet {
            for listener in listeners {
                listener(value)
            }
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        listeners.append(listener)
    }
}
