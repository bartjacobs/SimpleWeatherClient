//
//  ViewController.swift
//  Weather
//
//  Created by Bart Jacobs on 03/09/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!

    // MARK: - Private Properties

    var days = [Day]()

    private let dataManager = DataManager(baseURL: API.AuthenticatedBaseURL)

    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        return dateFormatter
    }()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()

        fetchWeatherData()
    }

    // MARK: - View Methods

    private func setupView() {
        setupTableView()
        setupMessageLabel()
        setupActivityIndicatorView()
    }

    private func updateView() {
        let hasDays = days.count > 0
        tableView.isHidden = !hasDays
        messageLabel.isHidden = hasDays

        if hasDays {
            tableView.reloadData()
        }
    }

    // MARK: -

    private func setupTableView() {
        tableView.isHidden = true
    }

    private func setupMessageLabel() {
        messageLabel.isHidden = true
        messageLabel.text = "Hmm ... I don't have anything to show you."
    }

    private func setupActivityIndicatorView() {
        activityIndicatorView.startAnimating()
    }

    // MARK: - Helper Methods

    private func fetchWeatherData() {
        dataManager.weatherDataForLocation(latitude: 37.8267, longitude: -122.423) { (location, error) in
            DispatchQueue.main.async {
                if let location = location {
                    self.days = location.days
                }

                self.updateView()
                self.activityIndicatorView.stopAnimating()
            }
        }
    }

}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue Reusable Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: DayTableViewCell.ReuseIdentifier, for: indexPath) as! DayTableViewCell

        // Fetch Day
        let day = days[indexPath.row]

        // Configure Cell
        cell.dateLabel.text = dateFormatter.string(from: day.date)
        cell.temperatureLabel.text = String(format: "%.0f - %.0f", day.min, day.max)

        return cell
    }

}
