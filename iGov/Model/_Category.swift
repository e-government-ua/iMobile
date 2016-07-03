// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Category.swift instead.

import Foundation
import CoreData

public enum CategoryAttributes: String {
    case nID = "nID"
    case nOrder = "nOrder"
    case sID = "sID"
    case sName = "sName"
}

public enum CategoryRelationships: String {
    case subcategories = "subcategories"
}

public class _Category: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Category"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Category.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var nID: NSNumber?

    @NSManaged public
    var nOrder: NSNumber?

    @NSManaged public
    var sID: String?

    @NSManaged public
    var sName: String?

    // MARK: - Relationships

    @NSManaged public
    var subcategories: NSSet

}

extension _Category {

    func addSubcategories(objects: NSSet) {
        let mutable = self.subcategories.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as Set<NSObject>)
        self.subcategories = mutable.copy() as! NSSet
    }

    func removeSubcategories(objects: NSSet) {
        let mutable = self.subcategories.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as Set<NSObject>)
        self.subcategories = mutable.copy() as! NSSet
    }

    func addSubcategoriesObject(value: Subcategory) {
        let mutable = self.subcategories.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.subcategories = mutable.copy() as! NSSet
    }

    func removeSubcategoriesObject(value: Subcategory) {
        let mutable = self.subcategories.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.subcategories = mutable.copy() as! NSSet
    }

}

