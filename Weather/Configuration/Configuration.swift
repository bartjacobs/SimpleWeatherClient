//
//  Configuration.swift
//  Weather
//
//  Created by Bart Jacobs on 04/09/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import Foundation

enum API {

    static let APIKey = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    static let BaseURL = URL(string: "https://api.darksky.net/forecast/")!

    static var AuthenticatedBaseURL: URL {
        return BaseURL.appendingPathComponent(APIKey)
    }

}
