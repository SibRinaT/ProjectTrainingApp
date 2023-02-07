//
//  TrainingScreen.swift
//  TrainingApp
//
//  Created by Ainur on 28.01.2023.
//

import Foundation
import UIKit
class TrainingScreen: UIViewController {
    @IBOutlet var beginnerView: [UIView]!
    @IBOutlet var armTrainingView: [UIView]!
    @IBOutlet var legsTrainingView: [UIView]!
    @IBOutlet var cardioTrainingView: [UIView]!
    
    @IBOutlet var armStart: [UIButton]!
    @IBOutlet var legsStart: [UIButton]!
    @IBOutlet var cardioStart: [UIButton]!
    @IBOutlet var warm_upStart: [UIButton]!
    @IBOutlet var chestStart: [UIButton]!
    @IBOutlet var absStart: [UIButton]!
    @IBOutlet var backStart: [UIButton]!

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for sides in armTrainingView {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        for sides in armStart {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        for sides in legsTrainingView {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        for sides in legsStart {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        
        for sides in cardioTrainingView {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        
        for sides in cardioStart {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }

        for sides in beginnerView {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        for sides in absStart {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        for sides in chestStart {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        for sides in backStart {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
        for sides in warm_upStart {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
    }
}
