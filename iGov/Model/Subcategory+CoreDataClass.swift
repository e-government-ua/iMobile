//
//  Subcategory+CoreDataClass.swift
//  iGov
//
//  Created by Yurii Kolesnykov on 19.09.16.
//  Copyright © 2016 iGov. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

@objc(Subcategory)
public class Subcategory: NSManagedObject {
    
    class func create(_ context: NSManagedObjectContext, category: Category, nID: Int, sName: String, sID: String, nOrder: Int, aService: [JSON]) ->Subcategory?
    {
        if let subcategory = Subcategory.mr_createEntity(in: context) {
            subcategory.nID = nID as NSNumber?
            subcategory.sName = sName
            subcategory.sID = sID
            subcategory.nOrder = nOrder as NSNumber?
            subcategory.category = category
            subcategory.addToServices(NSSet(array: Service.parse(context, subcategory: subcategory, jsonArray: aService)))
            return subcategory
        }
        else {
            return nil
        }
    }
    
    class func parse(_ context: NSManagedObjectContext, category: Category, jsonArray: [JSON]) -> [Subcategory] {
        var resultArray = [Subcategory]()
        
        for element in jsonArray {
            if let subcategoryDict = element.dictionary {
                guard
                    let nID = subcategoryDict["nID"]?.int,
                    let sName = subcategoryDict["sName"]?.string,
                    let sID = subcategoryDict["sID"]?.string,
                    let nOrder = subcategoryDict["nOrder"]?.int,
                    let services = subcategoryDict["aService"]?.array
                    else {
                        continue
                }
                
                if let newSubcategory = Subcategory.create(context, category: category, nID: nID, sName: sName, sID: sID, nOrder: nOrder, aService: services) {
                    resultArray.append(newSubcategory)
                }
            }
        }
        return resultArray
    }

}
