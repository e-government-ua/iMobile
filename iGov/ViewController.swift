//
//  ViewController.swift
//  iGov
//
//  Created by Yurii Kolesnykov on 03.07.16.
//  Copyright © 2016 iGov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Networking.sharedInstance.getListOfServices { (categories: [Category]) in
            print (categories)
        }
    }

}

