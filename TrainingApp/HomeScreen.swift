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
    
    @IBOutlet var weightHeighButton: [UIButton]!
    @IBOutlet var challengeButton: [UIButton]!
    
    @IBOutlet var collectionViews: [UIView]!
    @IBOutlet var daysCircles: [UIView]!
    
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

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        for sides in collectionViews {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        
        for sides in daysCircles {
            sides.layer.cornerRadius = sides.frame.size.width / 2
        }
        
        for sides in weightHeighButton {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        
        for sides in challengeButton {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        
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

