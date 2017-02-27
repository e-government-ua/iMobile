//
//  SMSTableViewCell.swift
//  iGov
//
//  Created by Sergii Maksiuta on 2/27/17.
//  Copyright © 2017 iGov. All rights reserved.
//

import UIKit

class SMSTableViewCell: UITableViewCell {
    lazy var textFields = [UITextField]()
    let smsdigits = 6

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        var i : Int
        for i in 0...smsdigits-1{
            let textField = UITextField()
            textFields.append(textField)
            self.addSubview(textField);
            textField.snp.makeConstraints({ (make) in
                let offset = 10.0
                make.left.equalTo(Double(i) * offset);
                make.width.equalTo(self.bounds.size.width/Double(smsdigits) - offset*Double(smsdigits + 1))
            });
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
