//
//  Subcategory.swift
//  iGov
//
//  Created by Serge Sukhanov on 03.07.16.
//  Copyright © 2016 iGov. All rights reserved.
//

import SwiftyJSON

class Subcategory {
    var nID: Int
    var sName: String
    var sID: String
    var nOrder: Int
    var aService: [Service]
    
    init(nID: Int, sName: String, sID: String, nOrder: Int, aService: [Service]) {
        self.nID = nID
        self.sName = sName
        self.sID = sID
        self.nOrder = nOrder
        self.aService = aService
    }
    
    class func parse(jsonArray: [JSON]) -> [Subcategory] {
        var resultArray = [Subcategory]()
        
        for element in jsonArray {
            if let subcategoryDict = element.dictionary {
                guard
                    let nID = subcategoryDict["nID"]?.int,
                    let sName = subcategoryDict["sName"]?.string,
                    let sID = subcategoryDict["sID"]?.string,
                    let nOrder = subcategoryDict["nOrder"]?.int,
                    let subcategories = subcategoryDict["aSubcategory"]?.array
                else {
                    continue
                }
                
                let newSubcategory = Subcategory(nID: nID, sName: sName, sID: sID, nOrder: nOrder, aService: Service.parse(subcategories))
                resultArray.append(newSubcategory)
            }
        }
        return resultArray
    }
}
