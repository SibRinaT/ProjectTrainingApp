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
    
    func configureWith(model: LevelCellViewModel) {
        levelImageView.image = UIImage(named: model.imageName)
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        lightningImageView.image = UIImage(named: model.level.lightningImageName)
    }
    
}
