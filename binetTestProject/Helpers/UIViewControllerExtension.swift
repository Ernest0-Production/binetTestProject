//
//  UIViewControllerExtension.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentSimpleAlertController(title: String, message: String? = nil, completion: ((UIAlertAction) -> ())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Закрыть", style: .cancel, handler: completion)
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
