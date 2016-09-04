//
//  Day.swift
//  Weather
//
//  Created by Bart Jacobs on 03/09/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import Foundation

struct Day {

    let date: Date
    let min: Double
    let max: Double

}

extension Day: JSONDecodable {

    public init?(JSON: Any) {
        guard let JSON = JSON as? [String: AnyObject] else { return nil }

        guard let time = JSON["time"] as? Double else { return nil }
        guard let min = JSON["temperatureMin"] as? Double else { return nil }
        guard let max = JSON["temperatureMax"] as? Double else { return nil }

        self.min = min
        self.max = max
        self.date = Date(timeIntervalSince1970: time)
    }
    
}
