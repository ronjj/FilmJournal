

import Foundation
import Combine
import FirebaseFirestore

class FilmRollsViewModel: ObservableObject {
  @Published var filmRolls = [FilmRoll]()
  
  private var db = Firestore.firestore()
  private var listenerRegistration: ListenerRegistration?
  
  deinit {
    unsubscribe()
  }
  
  func unsubscribe() {
    if listenerRegistration != nil {
      listenerRegistration?.remove()
      listenerRegistration = nil
    }
  }
  
  func subscribe() {
    if listenerRegistration == nil {
      listenerRegistration = db.collection("filmRolls").addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("No documents")
          return
        }
        
        self.filmRolls = documents.compactMap { queryDocumentSnapshot in
          try? queryDocumentSnapshot.data(as: FilmRoll.self)
        }
      }
    }
  }
  
  func removeFilmRolls(atOffsets indexSet: IndexSet) {
    let filmRolls = indexSet.lazy.map { self.filmRolls[$0] }
    filmRolls.forEach { filmRoll in
      if let documentId = filmRoll.id {
        db.collection("filmRolls").document(documentId).delete { error in
          if let error = error {
            print("Unable to remove document: \(error.localizedDescription)")
          }
        }
      }
    }
  }

  
}

