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
    
    
    func getListOfServices() {
      
        
        Alamofire.request(.GET, "https://igov.org.ua/api/catalog?bShowEmptyFolders=false")
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let value = response.result.value {
                    // handle the results as JSON, without a bunch of nested if loops
                    let json = JSON(value)
                    // now we have the results, let's just print them though a tableview would definitely be better UI:
                    print("The todo is: " + json.description)
                    if let categories = json.array {
                        if let category = categories[0].dictionary {
                            if let subcategories = category["aSubcategory"]?.array {
                                if let subcategory = subcategories[0].dictionary  {
                                    if let servicesArray = subcategory["aService"]?.array {
                                        for service in servicesArray {
                                            print("olollo service!")
                                            print(service)
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
        }
        
    }
    

}
