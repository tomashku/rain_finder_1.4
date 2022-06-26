//
//  Airport.swift
//  rain_finder_1.4
//
//  Created by Tomasz Zuczek on 26/06/2022.
//

import Foundation

struct Airport{
    var icaoCode: String
    var type: String
    var latitude: String
    var longitude: String
    init(icaoCode: String, type: String, latitude: String, longitude: String) {
        self.icaoCode = icaoCode
        self.type = type
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
