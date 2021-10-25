//
//  FilmRollsViewModel.swift
//  FilmJournal
//
//  Created by Ronald Jabouin on 10/15/21.
//

import SwiftUI

//class FilmRolls: ObservableObject{
//    @Published var filmRolls = [FilmRoll]()
//
//
//}



class coreDataViewModel: ObservableObject{
    
    let container: NSPersistentContainer
    @Published var savedEntities: [FilmRollEntity] = []
    
    init(){
        container = NSPersistentContainer(name: "FilmRollsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading core data \(error)")
            }
        }
        fetchRolls()
    }
    
    func fetchRolls() {
        let request = NSFetchRequest<FilmRollEntity>(entityName: "FilmRollEntity")
        
        do{
          savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("error fetching \(error)")
        }
       
    }
    func addRoll(text: String) {
        let newRoll = FilmRollEntity(context: container.viewContext)
        newRoll.stock = text
        saveDate()
        
    }
    
    func deleteRoll(indexSet: IndexSet) {
       guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveDate()
    }
    
    func updateRoll(entity: FilmRollEntity) {
//        let currentName = entity.name ?? ""
//        let newName = currentName + "!"
//        entity.name = newName
//        saveDate()
    }
    
    func saveDate() {
        do{
           try  container.viewContext.save()
            fetchRolls()
        } catch let error {
            print("error saving \(error)")
        }
       
    }
    
}

