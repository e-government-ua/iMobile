//
//  BankSelectorTableViewCell.swift
//  iGov
//
//  Created by Sergii Maksiuta on 2/23/17.
//  Copyright © 2017 iGov. All rights reserved.
//

import UIKit

class BankSelectorTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    class func reuseIdentifier() -> String{
        return "BankSelectorTableViewCell"
    }

}
