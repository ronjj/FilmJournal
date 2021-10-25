//
//  FilmJournalApp.swift
//  FilmJournal
//
//  Created by Ronald Jabouin on 10/15/21.
//

import SwiftUI

@main
struct FilmJournalApp: App {
   
    let roll = FilmRollEntity()
    var body: some Scene {
        
        WindowGroup {
            HomeView()
        }
    }
}
