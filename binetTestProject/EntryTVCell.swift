//
//  EntryTVCell.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import UIKit

class EntryTVCell: UITableViewCell {
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var createDateLabel: UILabel!
    @IBOutlet weak var modifyDateLabel: UILabel!
    
    static let reuseID = "entryID"
    
    var viewModel: EntryTVCellViewModel! {
        didSet {
            bodyLabel.text = viewModel.entryBody
            createDateLabel.text = viewModel.createDate
            modifyDateLabel.text = viewModel.modifyDate
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
