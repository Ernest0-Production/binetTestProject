//
//  EntityDetailController.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import UIKit

class EntryDetailController: UIViewController {
    @IBOutlet weak var createLabel: UILabel!
    @IBOutlet weak var modifyLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    var viewModel: EntryDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLabel.text = viewModel.createDate
        modifyLabel.text = viewModel.modifyDate
        textView.text = viewModel.entryBody
    }
}
