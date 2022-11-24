//
//  ViewController.swift
//  TrainingApp
//
//  Created by Ainur on 14.11.2022.
//

import UIKit

class HomeScreen: UIViewController {
    @IBOutlet var daysLabels: [UILabel]!
    @IBOutlet var daysIcons: [UIImageView]!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        let currentDate = Date() // текущее число
        let currentDay = currentDate.get(Calendar.Component.day)
        let calendar = Calendar.current

        var weekday = calendar.component(.weekday, from: currentDate) // текущий день недели
        let monday = currentDay - weekday + 2 // первый день недели
        let lastDay = monday - 7 // последний день недели

        var i = 0
        for dayLabel in daysLabels {
            dayLabel.text = "\(monday + i)"
            i += 1
        }
        
        weekday = 7 // for testing
        var n = 1
        for dayIcon in daysIcons {
            if weekday == n {
                dayIcon.image = UIImage(named: "icons8-fire-90")
            }
            n += 1
        }
        // Do any additional setup after loading the view.
    }

}

extension Date {
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
