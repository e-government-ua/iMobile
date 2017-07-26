//
//  TextFieldTableViewCell.swift
//  iGov
//
//  Created by Sergii Maksiuta on 2/23/17.
//  Copyright © 2017 iGov. All rights reserved.
//

import UIKit
import SnapKit

class TextFieldTableViewCell: UITableViewCell {
    fileprivate static let kReuseID = "TextFieldTableViewCell"
    var textField = UITextField()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(UIEdgeInsets.init(top: 5, left: 20, bottom: 5, right: 20))
        }
        textField.text = "Login"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class var reuseIdentifier: String {
        return kReuseID
    }

}
