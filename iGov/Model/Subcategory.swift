import Foundation
import SwiftyJSON
import CoreData
import MagicalRecord

@objc(Subcategory)
public class Subcategory: _Subcategory {
    class func create(context: NSManagedObjectContext, category: Category, nID: Int, sName: String, sID: String, nOrder: Int, aService: [JSON]) ->Subcategory?
    {
        if let subcategory = Subcategory.MR_createEntityInContext(context) {
            subcategory.nID = nID
            subcategory.sName = sName
            subcategory.sID = sID
            subcategory.nOrder = nOrder
            subcategory.category = category
            subcategory.addServices(NSSet(array: Service.parse(context, subcategory: subcategory, jsonArray: aService)))
            return subcategory
        }
        else {
            return nil
        }
    }
    
    class func parse(context: NSManagedObjectContext, category: Category, jsonArray: [JSON]) -> [Subcategory] {
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
