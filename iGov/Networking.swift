//
//  Networking.swift
//  iGov
//
//  Created by Yurii Kolesnykov on 03.07.16.
//  Copyright © 2016 iGov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Networking
{
    static let sharedInstance = Networking()
    
    
    func getListOfServices(completion: (([Category])->Void)? ) {
      
        
        Alamofire.request(.GET, "https://igov.org.ua/api/catalog?bShowEmptyFolders=false")
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let value = response.result.value {
                    let json = JSON(value)
                    if let categories = json.array {
                        if let aCompletion = completion {
                            aCompletion(Category.parse(categories))
                        }
                    }
                }
        }
        
    }
    

}
