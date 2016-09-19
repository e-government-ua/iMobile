//
//  Service+CoreDataClass.swift
//  iGov
//
//  Created by Yurii Kolesnykov on 19.09.16.
//  Copyright © 2016 iGov. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

@objc(Service)
public class Service: NSManagedObject {
    
    class func create(_ context: NSManagedObjectContext, subcategory: Subcategory, nOpenedLimit:Int, sSubjectOperatorName: String, nID: Int, sName: String, nOrder: Int, nID_Status: Int, nStatus:Int) ->Service?
    {
        if let service = Service.mr_createEntity(in: context) {
            service.nOpenedLimit = nOpenedLimit as NSNumber?
            service.sSubjectOperatorName = sSubjectOperatorName
            service.nID = nID as NSNumber?
            service.sName = sName
            service.nOrder = nOrder as NSNumber?
            service.nID_Status = nID_Status as NSNumber?
            service.nStatus = nStatus as NSNumber?
            service.subcategory = subcategory
            return service
        }
        else {
            return nil
        }
    }
    
    
    class func parse(_ context: NSManagedObjectContext, subcategory: Subcategory, jsonArray: [JSON]) -> [Service] {
        
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
