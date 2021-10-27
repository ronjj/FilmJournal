//
//  FilmJournalFirebaseApp.swift
//  FilmJournalFirebase
//
//  Created by Ronald Jabouin on 10/23/21.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main

struct FilmJournalFirebaseApp: App {
    @StateObject var viewModel = AuthenticationViewModel()
    
    init(){
        setupAuthentication()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
extension FilmJournalFirebaseApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
      GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
  }
}
