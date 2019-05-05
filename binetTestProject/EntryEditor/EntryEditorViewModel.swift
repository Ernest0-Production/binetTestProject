//
//  EntityEditorViewModel.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import Foundation

class EntryEditorViewModel {
    let uploadState = Observable<UploadState>(UploadState.none)
    
    func pushEntry(text: String) {
        uploadState.value = .uploading
        if !text.isEmpty {
            NetworkManager.shared.request(router: .addEntry(text: text)) { (result: Result<AddEntryResponse, Error>) in
                switch result {
                case .failure(let error):
                    self.uploadState.value = .error(descriptoin: error.localizedDescription)
                case .success:
                    self.uploadState.value = .success
                }
            }
        } else {
            uploadState.value = .error(descriptoin: "Пустая запись!")
        }
    }
}

enum UploadState: Equatable {
    case success
    case uploading
    case error(descriptoin: String)
    case none
}
