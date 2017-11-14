//
//  Networking.swift
//  iGov
//
//  Created by Yurii Kolesnykov on 03.07.16.
//  Copyright © 2016 iGov. All rights reserved.
//


import Alamofire
import SwiftyJSON
import MagicalRecord

class Networking
{
    static let sharedInstance = Networking()
    func getListOfServices(_ completion: (([Category])->Void)? ) {
        Alamofire.request("https://igov.org.ua/api/catalog?bShowEmptyFolders=false")
            .responseJSON
        { response in
            if let value = response.result.value {
                let json = JSON(value)
                if let categories = json.array {
                    if let aCompletion = completion {
                        let context = NSManagedObjectContext.mr_context(withParent: NSManagedObjectContext.mr_default())
                        aCompletion(Category.parse(context, jsonArray:categories))
                    }
                }
            }
        }
    }
}
