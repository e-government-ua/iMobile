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
    func getListOfServices(completion: (([Category])->Void)? ) {
        Alamofire.request(.GET, "https://igov.org.ua/api/catalog?bShowEmptyFolders=false")
            .responseJSON { response in
                if let value = response.result.value {
                    let json = JSON(value)
                    if let categories = json.array {
                        if let aCompletion = completion {
                            let context = NSManagedObjectContext.MR_contextWithParent(NSManagedObjectContext.MR_defaultContext())
                            aCompletion(Category.parse(context, jsonArray:categories))
                        }
                    }
                }
        }
        
    }
    

}
