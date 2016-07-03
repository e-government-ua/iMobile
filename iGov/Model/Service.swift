import SwiftyJSON
import CoreData

@objc(Service)
public class Service: _Service {
    class func create(context: NSManagedObjectContext, subcategory: Subcategory, nOpenedLimit:Int, sSubjectOperatorName: String, nID: Int, sName: String, nOrder: Int, nID_Status: Int, nStatus:Int) ->Service?
    {
        if let service = Service.MR_createEntityInContext(context) {
            service.nOpenedLimit = nOpenedLimit
            service.sSubjectOperatorName = sSubjectOperatorName
            service.nID = nID
            service.sName = sName
            service.nOrder = nOrder
            service.nID_Status = nID_Status
            service.nStatus = nStatus
            service.subcategory = subcategory
            return service
        }
        else {
            return nil
        }
    }
    
    
    class func parse(context: NSManagedObjectContext, subcategory: Subcategory, jsonArray: [JSON]) -> [Service] {
        
        var resultArray = [Service]()
        
        for element in jsonArray {
            if let serviceDict = element.dictionary {
                guard
                    let nOpenedLimit = serviceDict["nOpenedLimit"]?.int,
                    let sSubjectOperatorName = serviceDict["sSubjectOperatorName"]?.string,
                    let nID = serviceDict["nID"]?.int,
                    let sName = serviceDict["sName"]?.string,
                    let nOrder = serviceDict["nOrder"]?.int,
                    let nID_Status = serviceDict["nID_Status"]?.int,
                    let nStatus = serviceDict["nStatus"]?.int
                    else {
                        continue
                }
                if let service = Service.create(context, subcategory: subcategory, nOpenedLimit: nOpenedLimit, sSubjectOperatorName: sSubjectOperatorName,                                         nID: nID, sName: sName, nOrder: nOrder, nID_Status: nID_Status, nStatus: nStatus) {
                resultArray.append(service)
            }
            }
        }
        return resultArray
    }
}
