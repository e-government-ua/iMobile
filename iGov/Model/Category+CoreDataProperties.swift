//
//  Category+CoreDataProperties.swift
//  iGov
//
//  Created by Yurii Kolesnykov on 19.09.16.
//  Copyright © 2016 iGov. All rights reserved.
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category");
    }

    @NSManaged public var nID: NSNumber?
    @NSManaged public var nOrder: NSNumber?
    @NSManaged public var sID: String?
    @NSManaged public var sName: String?
    @NSManaged public var subcategories: NSSet?

}

// MARK: Generated accessors for subcategories
extension Category {

    @objc(addSubcategoriesObject:)
    @NSManaged public func addToSubcategories(_ value: Subcategory)

    @objc(removeSubcategoriesObject:)
    @NSManaged public func removeFromSubcategories(_ value: Subcategory)

    @objc(addSubcategories:)
    @NSManaged public func addToSubcategories(_ values: NSSet)

    @objc(removeSubcategories:)
    @NSManaged public func removeFromSubcategories(_ values: NSSet)

}
