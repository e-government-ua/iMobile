//
//  SMSTableViewCell.swift
//  iGov
//
//  Created by Sergii Maksiuta on 2/27/17.
//  Copyright © 2017 iGov. All rights reserved.
//

import UIKit

class SMSTableViewCell: UITableViewCell {
    static let kReuseID = "SMSTableViewCell"
    var textFields = [UITextField]()
    let smsdigits = 6

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let offset:CGFloat = 15.0
        let fieldWidth = (self.bounds.size.width-CGFloat(smsdigits+1)*offset)/CGFloat(smsdigits)
        let container = UIView()
        self.addSubview(container)
        
        container.snp.makeConstraints { (make) in
            make.width.equalTo(CGFloat(smsdigits)*fieldWidth + CGFloat(smsdigits + 1)*offset)
            make.top.bottom.equalTo(self)
            make.centerX.equalTo(self)
        }
        
        for i in 1...smsdigits{
            let textField = UITextField()
            textField.keyboardType = .numberPad
            textFields.append(textField)
            container.addSubview(textField);
            textField.backgroundColor = UIColor.red
            textField.snp.makeConstraints({ (make) in
                make.left.equalTo(CGFloat(i - 1)*fieldWidth+CGFloat(i)*offset)
                
                make.width.equalTo(fieldWidth)
                make.centerY.height.equalTo(self)
            });
        }
    }
    
    func numberFromSMSCode () -> String {
        var result : String = ""
        for field in textFields
        {
            result += field.text!
        }
        return result
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class var reuseIdentifier: String{
        return kReuseID
    }
}
