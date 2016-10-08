//
//  itemTableViewCell.swift
//  UVA Bucket List
//
//  Created by Nader Maharmeh on 9/24/16.
//  Copyright © 2016 Nader Maharmeh. All rights reserved.
//

import UIKit

class itemTableViewCell: UITableViewCell {
    
    var myText = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
    }
    
    // Configure the view for the selected state
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.selectionStyle = UITableViewCellSelectionStyle.none
        //super.setSelected(selected, animated: animated)
        //super.backgroundColor = UIColor.red
    }

}
