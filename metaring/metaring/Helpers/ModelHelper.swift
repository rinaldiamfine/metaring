//
//  ModelHelper.swift
//  metaring
//
//  Created by Rinaldi on 22/05/22.
//

import Foundation
import CoreData

class MetaringCoreDataManager {
    let persisntentContainer: NSPersistentContainer
    static let shared = MetaringCoreDataManager()
    var viewContext: NSManagedObjectContext {
        return persisntentContainer.viewContext
    }
    private init() {
        persisntentContainer = NSPersistentContainer(name: "metaring")
        persisntentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Unable to initialize coredata stack \(error)")
            }
        }
    }
    func save(completion: @escaping (Error?) -> () = {_ in}) {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
}
