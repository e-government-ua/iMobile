//
//  Subcategory+CoreDataProperties.swift
//  iGov
//
//  Created by Yurii Kolesnykov on 19.09.16.
//  Copyright © 2016 iGov. All rights reserved.
//

import Foundation
import CoreData


extension Subcategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Subcategory> {
        return NSFetchRequest<Subcategory>(entityName: "Subcategory");
    }

    @NSManaged public var nID: NSNumber?
    @NSManaged public var nOrder: NSNumber?
    @NSManaged public var sID: String?
    @NSManaged public var sName: String?
    @NSManaged public var category: Category?
    @NSManaged public var services: NSSet?

}

// MARK: Generated accessors for services
extension Subcategory {

    @objc(addServicesObject:)
    @NSManaged public func addToServices(_ value: Service)

    @objc(removeServicesObject:)
    @NSManaged public func removeFromServices(_ value: Service)

    @objc(addServices:)
    @NSManaged public func addToServices(_ values: NSSet)

    @objc(removeServices:)
    @NSManaged public func removeFromServices(_ values: NSSet)

}
