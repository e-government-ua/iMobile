//
//  Subcategory.swift
//  iGov
//
//  Created by Serge Sukhanov on 03.07.16.
//  Copyright © 2016 iGov. All rights reserved.
//

import Foundation
import SwiftyJSON

class Subcategory {
    
    var nID: Int
    var sName: String
    var sID: String
    var nOrder: Int
    
    //TODO: must changed from [String]? (optional) to [Service] (not optional)
    var aService: [String]?
    
    init(nID: Int, sName: String, sID: String, nOrder: Int) {
        self.nID = nID
        self.sName = sName
        self.sID = sID
        self.nOrder = nOrder
    }
    
    class func getSubcategories(jsonArray: [JSON]) -> [Subcategory] {
        var resultArray = [Subcategory]()
        
        for element in jsonArray {
            if let newSubcategory = element.dictionary {
                guard let nID = newSubcategory["nID"]?.int,
                    let sName = newSubcategory["sName"]?.string,
                    let sID = newSubcategory["sID"]?.string,
                    let nOrder = newSubcategory["nOrder"]?.int else {
                        continue
                }
                let newSubcategory = Subcategory(nID: nID, sName: sName, sID: sID, nOrder: nOrder)
                resultArray.append(newSubcategory)
            }
        }
        return resultArray
    }
}

//{
//    "nID": 3
//    "sName": "Поліція"
//    "sID": "Police"
//    "nOrder": 1
//    "aService": [...106]-
//}
//{
//    "nID": 22
//    "sName": "Соціальна допомога"
//    "sID": "SocHelp"
//    "nOrder": 2
//    "aService": [...55]-
//}
