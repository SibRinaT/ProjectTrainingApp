//
//  levelCollectionCell.swift
//  TrainingApp
//
//  Created by Ainur on 17.03.2023.
//

import Foundation
import UIKit
class LevelCollectionCell: UICollectionViewCell {
    @IBOutlet private var levelImageView: UIImageView!
    @IBOutlet private var lightningImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    var level: TrainingLevel? 
    
    func configureWith(model: LevelCellViewModel) {
        self.level = model.level
        levelImageView.image = UIImage(named: model.imageName)
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        lightningImageView.image = UIImage(named: model.level.lightningImageName)
    }
    
}
