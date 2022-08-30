//
//  Labor+CoreDataProperties.swift
//  Labor
//
//  Created by mehrnoush abdinian on 30.08.22.
//

import CoreData
import Foundation
import UIKit

public extension Labor {
    @nonobjc class func fetchRequest() -> NSFetchRequest<Labor> {
        return NSFetchRequest<Labor>(entityName: "Labor")
    }

    @NSManaged var dateAdded: Date?
    @NSManaged var noteText: String?
    @NSManaged var priorityColor: UIColor?
}

extension Labor: Identifiable {}
