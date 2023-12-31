//
//  CoreDataManager.swift
//  NotesCore
//
//  Created by Dogukaim on 30.12.2023.
//

import Foundation
import CoreData


class CoreDataManager {
    
    static let shared = CoreDataManager(modelName: "NotesCore")
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName: String) {
            persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { (description,error) in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            completion?()
        }
    }
    
    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print( "An Error ocurred while saving: \(error.localizedDescription)")
            }
        }
    }
}


//MARK: Helper

extension CoreDataManager {
    func cretateNote() -> Note {
        let note = Note(context: viewContext)
        note.id = UUID()
        note.text = ""
        note.lastUpdated = Date()
        save()
        return note
    }
}
