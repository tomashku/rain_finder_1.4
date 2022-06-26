//
//  AirportEntity+CoreDataProperties.swift
//  rain_finder_1.4
//
//  Created by Tomasz Zuczek on 26/06/2022.
//
//

import Foundation
import CoreData


extension AirportEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AirportEntity> {
        return NSFetchRequest<AirportEntity>(entityName: "AirportEntity")
    }

    @NSManaged public var icaoCode: String?
    @NSManaged public var type: String?
    @NSManaged public var latitude: String?
    @NSManaged public var longitude: String?

}

extension AirportEntity : Identifiable {

}
