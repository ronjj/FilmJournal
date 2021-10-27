//
//  ContentView.swift
//  FilmJournalFirebase
//
//  Created by Ronald Jabouin on 10/23/21.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var viewModel: AuthenticationViewModel

  var body: some View {
    switch viewModel.state {
    case .signedIn: FilmRollsListView()
    case .signedOut: LoginView()
    }
  }
}
