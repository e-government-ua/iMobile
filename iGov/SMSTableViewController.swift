//
//  SMSTableViewController.swift
//  iGov
//
//  Created by Sergii Maksiuta on 2/27/17.
//  Copyright © 2017 iGov. All rights reserved.
//

import UIKit

class SMSTableViewController: UITableViewController, UITextFieldDelegate {
    var textFields = [UITextField]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(SMSTableViewCell.self, forCellReuseIdentifier: SMSTableViewCell.reuseIdentifier)
        self.tableView.register(ButtonTableViewCell.self,  forCellReuseIdentifier:ButtonTableViewCell.reuseIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SMSTableViewCell.reuseIdentifier, for: indexPath) as! SMSTableViewCell
            self.textFields = cell.textFields
            for textField in cell.textFields{
                textField.delegate = self
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.reuseIdentifier, for: indexPath) as! ButtonTableViewCell
            cell.button.setTitle("Підтвердити", for: .normal)
            return cell
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
        /*
        var index = -1
            for field in textFields {
                if field == textField{
                    index = textFields.index(of: textField)!
                    break
                }
            }
            var nextField : UITextField? = nil
            if index > 0{
                if index < (textFields.count - 1) {
                    nextField = textFields[index]
                }
                if nextField == nil{
                    let cell =  self.tableView(self.tableView, cellForRowAt:IndexPath.init(row: 1, section: 0)) as! ButtonTableViewCell
                    cell.button.sendActions(for: .touchUpInside)
                }
                else
                {
                    nextField?.becomeFirstResponder()
                }
            }
        return true*/
    }
}
