//
//  Service+CoreDataProperties.swift
//  iGov
//
//  Created by Yurii Kolesnykov on 19.09.16.
//  Copyright © 2016 iGov. All rights reserved.
//

import Foundation
import CoreData


extension Service {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Service> {
        return NSFetchRequest<Service>(entityName: "Service");
    }

    @NSManaged public var nID: NSNumber?
    @NSManaged public var nID_Status: NSNumber?
    @NSManaged public var nOpenedLimit: NSNumber?
    @NSManaged public var nOrder: NSNumber?
    @NSManaged public var nStatus: NSNumber?
    @NSManaged public var sID: String?
    @NSManaged public var sName: String?
    @NSManaged public var sSubjectOperatorName: String?
    @NSManaged public var subcategory: Subcategory?

}
