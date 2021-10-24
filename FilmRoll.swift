//
//  FilmRoll.swift
//  FilmJournalFirebase
//
//  Created by Ronald Jabouin on 10/23/21.
//

import Foundation
import FirebaseFirestoreSwift

struct FilmRoll: Identifiable, Codable {
    @DocumentID var id: String?
    var stock: String
    var iso: Int
    var cameraUsed: String
    var numberOfPictures: Int
    var extraNotes: String
    var location: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case stock
        case iso
        case cameraUsed
        case numberOfPictures
        case extraNotes
        case location
        
    }
}

