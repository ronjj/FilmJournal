//
//  BookViewModel.swift
//  BookSpine
//
//  Created by Peter Friese on 09/06/2020.
//  Copyright © 2020 Google LLC. All rights reserved.
//

import Foundation
import Combine
import FirebaseFirestore

class FilmRollViewModel: ObservableObject {
  // MARK: - Public properties
  
  @Published var filmRoll: FilmRoll
  @Published var modified = false
  
  // MARK: - Internal properties
  
  private var cancellables = Set<AnyCancellable>()
  
  // MARK: - Constructors
  
    init(filmRoll: FilmRoll = FilmRoll(stock: "", iso: 200, cameraUsed: "", numberOfPictures: 36, extraNotes: "", location: "")) {
    self.filmRoll = filmRoll
    
    self.$filmRoll
      .dropFirst()
      .sink { [weak self] filmRoll in
        self?.modified = true
      }
      .store(in: &self.cancellables)
  }
  
  // MARK: - Firestore
  
  private var db = Firestore.firestore()
  
  private func addFilmRoll(_ filmRoll: FilmRoll) {
    do {
      let _ = try db.collection("filmRolls").addDocument(from: filmRoll)
    }
    catch {
      print(error)
    }
  }
  
  private func updateFilmRoll(_ filmRoll: FilmRoll) {
    if let documentId = filmRoll.id {
      do {
        try db.collection("filmRolls").document(documentId).setData(from: filmRoll)
      }
      catch {
        print(error)
      }
    }
  }
  
  private func updateOrAddFilmRoll() {
    if let _ = filmRoll.id {
      self.updateFilmRoll(self.filmRoll)
    }
    else {
      addFilmRoll(filmRoll)
    }
  }
  
  private func removeFilmRoll() {
    if let documentId = filmRoll.id {
      db.collection("filmRolls").document(documentId).delete { error in
        if let error = error {
          print(error.localizedDescription)
        }
      }
    }
  }
  
  // MARK: - UI handlers
  
  func handleDoneTapped() {
    self.updateOrAddFilmRoll()
  }
  
  func handleDeleteTapped() {
    self.removeFilmRoll()
  }
  
}
