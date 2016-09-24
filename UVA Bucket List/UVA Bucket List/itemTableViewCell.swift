//
//  itemTableViewCell.swift
//  UVA Bucket List
//
//  Created by Nader Maharmeh on 9/24/16.
//  Copyright © 2016 Nader Maharmeh. All rights reserved.
//

import UIKit

class itemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
