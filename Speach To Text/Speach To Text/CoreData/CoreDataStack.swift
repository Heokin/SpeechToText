//
//  CoreDataStack.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 14.03.23.
//

import Foundation
import CoreData

class CoreDataStack {
    
    lazy var viewContext: NSManagedObjectContext = persistentContainer.viewContext
    
    lazy var dataFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        return formatter
    }()
        
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Speach_To_Text")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func obtaineRecord(text: String, name: String, state: Int16, path: String) -> Record {
        let record = Record(context: viewContext)
        record.id = UUID()
        record.name = name
        
        record.date = Date()
        record.text = text
        record.state = state
        record.path = path
        
        do {
            try viewContext.save()
        } catch let error {
            print ("Error: \(error)")
        }
        
        return record
    }
    
    func updateRecord(with id: UUID, text: String, name: String, state: Int16){
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Record")
        fetchRequest.predicate = NSPredicate (format: "id = " + id.uuidString)

        if let records = try? viewContext.fetch(fetchRequest) as? [Record] {
            guard let record = records.first else { return }

            record.name = name
            record.text = text
            record.state = state
            
            try? viewContext.save()
        }
        
    }
    
    func findAll() -> [Record] {
        // Helpers
        // Create Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Record")

        guard let records = try? viewContext.fetch(fetchRequest) as? [Record] else { return [] }
        
        return records
    }
    
    func findRecord() -> Record {
        // Helpers
        // Create Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Record")

        let record = try? viewContext.fetch(fetchRequest) as? [Record]
        
        return (record?.first!)!
    }
    
    func removeRecord(with id: UUID){
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Record")
        fetchRequest.predicate = NSPredicate (format: "id = " + id.uuidString)

        if let records = try? viewContext.fetch(fetchRequest) as? [Record] {
            guard let record = records.first else { return }

            viewContext.delete(record)
            
            try? viewContext.save()
        }
        
    }
    
    public func filePath(for key: String) -> URL? {
        let fileManager = FileManager.default
        
        guard let documentURL = fileManager.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else { return nil }
        
        return documentURL.appendingPathComponent(key + ".m4a")
    }

}
