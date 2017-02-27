//
//  LoginTableViewController.swift
//  iGov
//
//  Created by Sergii Maksiuta on 2/23/17.
//  Copyright © 2017 iGov. All rights reserved.
//

import UIKit

class LoginTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(BankSelectorTableViewCell.self,
                                forCellReuseIdentifier:BankSelectorTableViewCell.reuseIdentifier())
        self.tableView.register(TextFieldTableViewCell.self,
                                forCellReuseIdentifier:TextFieldTableViewCell.reuseIdentifier())
        self.tableView.register(ButtonTableViewCell.self,
                                forCellReuseIdentifier:ButtonTableViewCell.reuseIdentifier())
        
        //Here we should register new cell
//        self.tableView.style = .grouped
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0){
            return 50
        }
        return 0
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0){
            let result = UILabel()
            result.text = "Щоб увійти до системи BankID,\n треба увійти у свій банк."
            result.numberOfLines = 0
            result.font = UIFont(name: "SFUIText-Regular", size: 15)
            result.textAlignment = .center
            
            return result
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section < 1){
            return 44
        }
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BankSelectorTableViewCell.reuseIdentifier(), for: indexPath)
            cell.textLabel?.text = "Privatbank"
            cell.accessoryType = .disclosureIndicator
            return cell
        case 1:
            if (indexPath.row < 2)
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.reuseIdentifier(), for: indexPath)
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.reuseIdentifier(), for: indexPath) as! ButtonTableViewCell
                cell.button.addTarget(self, action: #selector(showNextScreen), for: .touchUpInside)
                return cell
                
            }
        default:
            return tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.reuseIdentifier(), for: indexPath)
        }
        
    }
    
    func showNextScreen(){
        let nextController = SMSTableViewController()
        self.navigationController?.pushViewController(nextController, animated: true)
    }
    
}
