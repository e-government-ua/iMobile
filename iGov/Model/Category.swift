import CoreData
import SwiftyJSON

@objc(Category)

public class Category: _Category {
    
    class func create(context: NSManagedObjectContext, nID: Int, sName: String, sID: String, nOrder: Int, aSubcategory: [JSON]) -> Category?
    {
        if let category = Category.MR_createEntityInContext(context) {
            category.nID = nID
            category.sName = sName
            category.sID = sID
            category.nOrder = nOrder
            let subcategories = Subcategory.parse(context, category: category, jsonArray: aSubcategory)
            
            category.addSubcategories(NSSet(array:subcategories))
            return category
        }
        return nil
      
    }
    
    class func parse(context: NSManagedObjectContext, jsonArray: [JSON]) -> [Category] {
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



