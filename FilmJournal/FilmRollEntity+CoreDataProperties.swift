//
//  FilmRollEntity+CoreDataProperties.swift
//  FilmJournal
//
//  Created by Ronald Jabouin on 10/23/21.
//
//

import Foundation
import CoreData


extension FilmRollEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FilmRollEntity> {
        return NSFetchRequest<FilmRollEntity>(entityName: "FilmRollEntity")
    }

    @NSManaged public var cameraUsed: String?
    @NSManaged public var dateString: Date?
    @NSManaged public var iso: String?
    @NSManaged public var location: String?
    @NSManaged public var notes: String?
    @NSManaged public var stock: String?
    @NSManaged public var timeString: Date?

}

extension FilmRollEntity : Identifiable {

}
