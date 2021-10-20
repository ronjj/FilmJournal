//
//  FilmRoll Model.swift
//  FilmJournal
//
//  Created by Ronald Jabouin on 10/15/21.
//

import Foundation
import SwiftUI

struct FilmRoll: Identifiable {
    let id = UUID()
    var stock: String
    var iso: String
    var cameraUsed: String
    var location: String
    var dateStringEvent: Date
       var dateString: String {
           let formatter = DateFormatter()
           formatter.dateFormat = "MM-dd-YY"
           return formatter.string(from: dateStringEvent)
       }
    var timeStringEvent: Date
        var timeString: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "h:mm a"
            formatter.timeZone = NSTimeZone(name: "EDT") as TimeZone?
            return formatter.string(from: timeStringEvent)
        }
    var notes: String
}
