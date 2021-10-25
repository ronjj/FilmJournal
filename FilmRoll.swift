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
    var lensInfo: String
    var startDateEvent: Date
       var startDateString: String {
           let formatter = DateFormatter()
           formatter.dateFormat = "E, d MMM yyyy"
           return formatter.string(from: startDateEvent)
       }
    var endDateEvent: Date
        var endDateString: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "E, d MMM yyyy"
            return formatter.string(from: endDateEvent)
        }
//        var timeString: String {
//            let formatter = DateFormatter()
//            formatter.dateFormat = "h:mm a"
//            formatter.timeZone = NSTimeZone(name: "EDT") as TimeZone?
//            return formatter.string(from: dateEvent)
//        }
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case stock
        case iso
        case cameraUsed
        case numberOfPictures
        case extraNotes
        case location
        case lensInfo
        case startDateEvent
        case endDateEvent
        
    }
}

