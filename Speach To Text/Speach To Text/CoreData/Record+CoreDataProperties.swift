//
//  Record+CoreDataProperties.swift
//  
//
//  Created by Kirill Sedliarov on 14.03.23.
//
//

import Foundation
import CoreData


extension Record {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Record> {
        return NSFetchRequest<Record>(entityName: "Record")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var path: String?
    @NSManaged public var state: Int16
    @NSManaged public var text: String?

}
