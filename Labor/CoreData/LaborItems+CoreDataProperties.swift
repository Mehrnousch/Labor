//
//  LaborItems+CoreDataProperties.swift
//  Labor
//
//  Created by mehrnoush abdinian on 04.09.22.
//

import UIKit
import CoreData

extension LaborItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LaborItems> {
        return NSFetchRequest<LaborItems>(entityName: "LaborItems")
    }

    @NSManaged public var token: String?

}

extension LaborItems : Identifiable {

}
