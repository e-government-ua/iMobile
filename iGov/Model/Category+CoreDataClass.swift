//
//  Category+CoreDataClass.swift
//  iGov
//
//  Created by Yurii Kolesnykov on 19.09.16.
//  Copyright © 2016 iGov. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

@objc(Category)
public class Category: NSManagedObject {
    class func create(_ context: NSManagedObjectContext, nID: NSNumber, sName: String, sID: String, nOrder: NSNumber, aSubcategory: [JSON]) -> Category?
    {
        if let category = Category.mr_createEntity(in: context) {
            category.nID = nID
            category.sName = sName
            category.sID = sID
            category.nOrder = nOrder
            let subcategories = Subcategory.parse(context, category: category, jsonArray: aSubcategory)
            
            category.addToSubcategories(NSSet(array:subcategories))
            return category
        }
        return nil
    }
    
    class func parse(_ context: NSManagedObjectContext, jsonArray: [JSON]) -> [Category] {
        var resultArray = [Category]()
        
        for element in jsonArray {
            if let category = element.dictionary {
                guard
                    let nID = category["nID"]?.number,
                    let sName = category["sName"]?.string,
                    let sID = category["sID"]?.string,
                    let nOrder = category["nOrder"]?.number,
                    let subcategories = category["aSubcategory"]?.array
                    else {
                        continue
                }
                if let category = Category.create(context, nID: nID, sName: sName, sID: sID, nOrder: nOrder, aSubcategory: subcategories)
                {
                    resultArray.append(category)
                }
            }
        }
        return resultArray
    }
}
