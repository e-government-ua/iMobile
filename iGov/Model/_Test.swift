// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Test.swift instead.

import Foundation
import CoreData

public enum TestAttributes: String {
    case test = "test"
}

public class _Test: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Test"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Test.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var test: String?

    // MARK: - Relationships

}

