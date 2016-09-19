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
    class func create(_ context: NSManagedObjectContext, nID: Int, sName: String, sID: String, nOrder: Int, aSubcategory: [JSON]) -> Category?
    {
        if let category = Category.mr_createEntity(in: context) {
            category.nID = nID as NSNumber?
            category.sName = sName
            category.sID = sID
            category.nOrder = nOrder as NSNumber?
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
                    let nID = category["nID"]?.int,
                    let sName = category["sName"]?.string,
                    let sID = category["sID"]?.string,
                    let nOrder = category["nOrder"]?.int,
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
