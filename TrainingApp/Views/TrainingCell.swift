//
//  TrainingCell.swift
//  TrainingApp
//
//  Created by Ainur on 16.02.2023.
//

import Foundation
import UIKit
class TrainingCell: UITableViewCell {
    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
     
    
    func configure(with model: TrainingCellViewModel){
        titleLabel.text = model.title
        iconImageView.image = UIImage(named: model.imageName)
    }
    
    @IBAction func startButtonTouched() {
        
    }
}
     
