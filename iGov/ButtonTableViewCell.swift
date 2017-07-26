//
//  ButtonTableViewCell.swift
//  iGov
//
//  Created by Sergii Maksiuta on 2/23/17.
//  Copyright © 2017 iGov. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    static let kReuseID = "ButtonTableViewCell"
    var button = UIButton()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(UIEdgeInsets.init(top: 5, left: 20, bottom: 5, right: 20))
        }
        button.setTitle("Безпечний вхід", for: .normal)
        button.backgroundColor = UIColor(red: 81/255.0, green: 85/255.0, blue: 93/255.0, alpha: 1)
        
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
