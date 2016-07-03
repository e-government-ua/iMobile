// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Subcategory.swift instead.

import Foundation
import CoreData

public enum SubcategoryAttributes: String {
    case nID = "nID"
    case nOrder = "nOrder"
    case sID = "sID"
    case sName = "sName"
}

public enum SubcategoryRelationships: String {
    case category = "category"
    case services = "services"
}

public class _Subcategory: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Subcategory"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Subcategory.entity(managedObjectContext) else { return nil }
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
    var category: Category?

    @NSManaged public
    var services: NSSet

}

extension _Subcategory {

    func addServices(objects: NSSet) {
        let mutable = self.services.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as Set<NSObject>)
        self.services = mutable.copy() as! NSSet
    }

    func removeServices(objects: NSSet) {
        let mutable = self.services.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as Set<NSObject>)
        self.services = mutable.copy() as! NSSet
    }

    func addServicesObject(value: Service) {
        let mutable = self.services.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.services = mutable.copy() as! NSSet
    }

    func removeServicesObject(value: Service) {
        let mutable = self.services.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.services = mutable.copy() as! NSSet
    }

}

