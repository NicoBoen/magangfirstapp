//
//  TableViewCell.swift
//  MyFirstApp
//
//  Created by Nico Boentoro on 7/10/17.
//  Copyright © 2017 Nico Boentoro. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var showLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
