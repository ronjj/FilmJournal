//
//  FilmJournalFirebaseApp.swift
//  FilmJournalFirebase
//
//  Created by Ronald Jabouin on 10/23/21.
//

import SwiftUI
import Firebase

@main
struct FilmJournalFirebaseApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            FilmRollsListView()
        }
    }
}
