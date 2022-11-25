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
        var calendar = Calendar.current
        calendar.firstWeekday = 0

        let weekday = calendar.component(.weekday, from: currentDate) // текущий день недели
        let monday = currentDate.startOfWeek() + 1 // первый день недели

        var i = 0
        for dayLabel in daysLabels {
            dayLabel.text = "\(monday.get(.day) + i)"
            i += 1
        }
        
        var n = 1
        for dayIcon in daysIcons {
            if weekday - 1 == n {
                dayIcon.image = UIImage(named: "dayFire")
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
    
    func startOfWeek() -> Date {
        Calendar.current.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: self).date!
    }
}

