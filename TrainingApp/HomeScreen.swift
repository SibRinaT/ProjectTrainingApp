//
//  ViewController.swift
//  TrainingApp
//
//  Created by Ainur on 14.11.2022.
//

import UIKit

class HomeScreen: UIViewController {
    @IBOutlet var daysLabels: [UILabel]!

    @IBOutlet var daysCirles: [UIView]!
    @IBOutlet var calendarView: [UIView]!
    @IBOutlet var graphicView: [UIView]!
    @IBOutlet var weightHeightView: [UIView]!
    @IBOutlet var challengeView: [UIView]!
    
    @IBOutlet var daysIcons: [UIImageView]!
    
    @IBOutlet var weightHeighButton: [UIButton]!
    @IBOutlet var challengeButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for sides in calendarView {
            sides.layer.cornerRadius = 10
            sides.clipsToBounds = true
        }
        
        for circles in daysCirles {
            circles.layer.cornerRadius =  15
        }
        
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
        
        for sides in graphicView {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        
        for sides in weightHeightView {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        
        for sides in weightHeighButton {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        
        for sides in challengeButton {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        
        for sides in challengeView {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
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

