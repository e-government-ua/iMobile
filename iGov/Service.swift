//
//  Service.swift
//  iGov
//
//  Created by Yurii Kolesnykov on 03.07.16.
//  Copyright © 2016 iGov. All rights reserved.
//

import Foundation
import SwiftyJSON

/*
 
 "nOpenedLimit": 0
 "sSubjectOperatorName": "Міністерство внутрішніх справ"
 "openedLimit": 0
 "subjectOperatorName": "Міністерство внутрішніх справ"
 "nID": 1
 "sName": "Надання довідки про притягнення до кримінальної відповідальності, відсутність (наявність) судимості або обмежень, передбачених кримінально-процесуальним законодавством України"
 "nOrder": 1
 "nSub": 3
 "nID_Status": 0
 "nStatus": 2
 */

class Service {
    var nOpenedLimit: Int?
    var sSubjectOperatorName: String?
    var nID: Int?
    var sName: String?
    var nOrder: Int?
    var nID_Status: Int?
    var nStatus: Int?
    init(){
    }
    
    class func parse(services: JSON?) {
        if let servicesArray = services?.array{
            for serviceJSON in servicesArray {
                if let serviceDict = serviceJSON.dictionary {
                    let service: Service = Service()
                    service.nOpenedLimit = serviceDict["nOpenedLimit"]?.int
                    service.sSubjectOperatorName = serviceDict["sSubjectOperatorName"]?.string
                    service.nID = serviceDict["nID"]?.int
                    service.sName = serviceDict["sName"]?.string
                    service.nOrder = serviceDict["nOrder"]?.int
                    service.nID_Status = serviceDict["nID_Status"]?.int
                    service.nStatus = serviceDict["nStatus"]?.int
                }
            }
        }
        
    }
}
