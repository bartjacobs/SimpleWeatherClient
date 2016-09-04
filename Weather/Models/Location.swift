//
//  Location.swift
//  Weather
//
//  Created by Bart Jacobs on 04/09/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import Foundation

struct Location {

    let lat: Double
    let long: Double

    let days: [Day]

}

extension Location: JSONDecodable {

    init?(JSON: Any) {
        guard let JSON = JSON as? [String: AnyObject] else { return nil }

        guard let lat = JSON["latitude"] as? Double else { return nil }
        guard let long = JSON["longitude"] as? Double else { return nil }
        guard let dailyData = JSON["daily"]?["data"] as? [[String: AnyObject]] else { return nil }

        self.lat = lat
        self.long = long

        var buffer = [Day]()

        for dailyDataPoint in dailyData {
            if let day = Day(JSON: dailyDataPoint) {
                buffer.append(day)
            }
        }
        
        self.days = buffer
    }

}
