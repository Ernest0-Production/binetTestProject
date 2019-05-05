//
//  EntityEditorController.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import UIKit

class EntryEditorController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var viewModel = EntryEditorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBind()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Создать", style: .done, target: self, action: #selector(createButtonTapped))
    }
    
    func setupBind() {
        viewModel.uploadState.bind { [unowned self] (value) in
            DispatchQueue.main.async {
                switch value {
                case .error(let text):
                    self.presentSimpleAlertController(title: "Ошибка отправки", message: text)
                    self.title = "Ошибка!"
                    self.navigationController?.navigationBar.isUserInteractionEnabled = true
                    self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
                case .uploading:
                    self.title = "Отправка..."
                    self.navigationController?.navigationBar.isUserInteractionEnabled = false
                    self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
                case .success:
                    self.navigationController?.navigationBar.isUserInteractionEnabled = true
                    self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
                    self.navigationController?.popViewController(animated: true)
                default: break
                }
            }
        }
    }
    
    // MARK: - Actions
    
    @objc func createButtonTapped() {
        title = "Отправка..."
        viewModel.pushEntry(text: textView.text)
    }
}
