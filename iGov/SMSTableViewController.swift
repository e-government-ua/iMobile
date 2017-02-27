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
        self.tableView.register(SMSTableViewCell.self, forCellReuseIdentifier: SMSTableViewCell.reuseIdentifier())
        self.tableView.register(ButtonTableViewCell.self,  forCellReuseIdentifier:ButtonTableViewCell.reuseIdentifier())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: SMSTableViewCell.reuseIdentifier(), for: indexPath) as! SMSTableViewCell
            self.textFields = cell.textFields
            for textField in cell.textFields{
                textField.delegate = self
            }
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.reuseIdentifier(), for: indexPath) as! ButtonTableViewCell
            cell.button.setTitle("Підтвердити", for: .normal)
            return cell
        }
        
        //return UITableViewCell()
        // Configure the cell...
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
    

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
