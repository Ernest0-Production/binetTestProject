//
//  EntitiesTViewModel.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import Foundation

class EntriesTViewModel {
    var items = Observable<[Entry]>([])
    var isRefreshing = Observable<Bool>(false)
    var error = Observable<Error?>(nil)
    
    func fetchData() {
        isRefreshing.value = true
        NetworkManager.shared.request(router: .getEntries) { (result: Result<[[Entry]],Error>) in
            self.isRefreshing.value = false
            switch result {
            case .failure(let error):
                self.error.value = error
            case .success(let data):
                self.items.value = data.first!
            }
        }
    }
}
