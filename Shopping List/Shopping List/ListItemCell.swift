//
//  ListItemCell.swift
//  Shopping List
//
//  Created by Kedar Rao on 10/3/17.
//  Copyright © 2017 Kedar Rao. All rights reserved.
//

import UIKit

class ListItemCell: UITableViewCell {

    @IBOutlet weak var listItemName: UILabel!
    
    @IBOutlet weak var checkedItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func decorate(itemName: String, checked: Bool) {
        listItemName.text = itemName
        if checked {
            checkedItem.text = "✓"
        } else {
            checkedItem.text = ""
        }
    }
}
