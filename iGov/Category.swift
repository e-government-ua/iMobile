//
//  Category.swift
//  iGov
//
//  Created by Serge Sukhanov on 03.07.16.
//  Copyright © 2016 iGov. All rights reserved.
//

import Foundation
import SwiftyJSON

class Category {
    var nID: Int
    var sName: String
    var sID: String
    var nOrder: Int
    var aSubcategory: [Subcategory]
    
    init(nID: Int, sName: String, sID: String, nOrder: Int, aSubcategory: [Subcategory]) {
        self.nID = nID
        self.sName = sName
        self.sID = sID
        self.nOrder = nOrder
        self.aSubcategory = aSubcategory
    }
    
    class func getCategories(jsonArray: [JSON]) -> [Category] {
        var resultArray = [Category]()
        
        for element in jsonArray {
            if let category = element.dictionary {
                guard let nID = category["nID"]?.int,
                    let sName = category["sName"]?.string,
                    let sID = category["sID"]?.string,
                    let nOrder = category["nOrder"]?.int,
                    let subcategories = category["aSubcategory"]?.array else {
                        continue
                }
                let newCategory = Category(nID: nID, sName: sName, sID: sID, nOrder: nOrder, aSubcategory: Subcategory.getSubcategories(subcategories))
                resultArray.append(newCategory)
            }
        }
        return resultArray
    }
}

//{
//    "nID": 1
//    "sName": "Громадянам"
//    "sID": "Citizen"
//    "nOrder": 1
//    "aSubcategory": [...10]-
//}-
//1:  {
//    "nID": 2
//    "sName": "Бізнесу"
//    "sID": "Business"
//    "nOrder": 2
//    "aSubcategory": [...13]-
//}
