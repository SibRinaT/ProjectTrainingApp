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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for sides in beginnerView {
            sides.layer.cornerRadius = 16
            sides.clipsToBounds = true
        }
    }
}
