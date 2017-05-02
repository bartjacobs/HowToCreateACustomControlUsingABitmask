//
//  ViewController.swift
//  Schedules
//
//  Created by Bart Jacobs on 02/05/2017.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet var schedulePicker: SchedulePicker!

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup View
        setupView()
    }

    // MARK: - View Methods

    fileprivate func setupView() {
        // Setup Schedule Picker
        setupSchedulePicker()
    }

    // MARK: -

    fileprivate func setupSchedulePicker() {
        // Fetch Stored Value
        let scheduleRawValue = UserDefaults.standard.integer(forKey: UserDefaults.Keys.schedule)

        // Configure Schedule Picker
        schedulePicker.schedule = Schedule(rawValue: scheduleRawValue)
    }

    // MARK: - Actions

    @IBAction func scheduleDidChange(_ sender: SchedulePicker) {
        // Helpers
        let userDefaults = UserDefaults.standard

        // Store Value
        let scheduleRawValue = sender.schedule.rawValue
        userDefaults.set(scheduleRawValue, forKey: UserDefaults.Keys.schedule)
        userDefaults.synchronize()
    }

}

extension UserDefaults {

    enum Keys {
        
        static let schedule = "schedule"
        
    }
    
}
