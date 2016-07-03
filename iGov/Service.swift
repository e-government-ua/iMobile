//
//  Service.swift
//  iGov
//
//  Created by Yurii Kolesnykov on 03.07.16.
//  Copyright © 2016 iGov. All rights reserved.
//

import SwiftyJSON

class Service {
    var nOpenedLimit: Int
    var sSubjectOperatorName: String
    var nID: Int
    var sName: String
    var nOrder: Int
    var nID_Status: Int
    var nStatus: Int
    
    init(nOpenedLimit:Int, sSubjectOperatorName: String, nID: Int, sName: String, nOrder: Int, nID_Status: Int, nStatus:Int)
    {
        self.nOpenedLimit = nOpenedLimit
        self.sSubjectOperatorName = sSubjectOperatorName
        self.nID = nID
        self.sName = sName
        self.nOrder = nOrder
        self.nID_Status = nID_Status
        self.nStatus = nStatus
    }
    
    class func parse(jsonArray: [JSON]) -> [Service] {
        
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
                let service = Service(nOpenedLimit: nOpenedLimit, sSubjectOperatorName: sSubjectOperatorName,
                                      nID: nID, sName: sName, nOrder: nOrder, nID_Status: nID_Status, nStatus: nStatus)
                resultArray.append(service)
            }
        }
        return resultArray
    }
}
