//
//  DayTableViewCell.swift
//  Weather
//
//  Created by Bart Jacobs on 03/09/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class DayTableViewCell: UITableViewCell {

    static let ReuseIdentifier = "DayTableViewCell"

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!

}
