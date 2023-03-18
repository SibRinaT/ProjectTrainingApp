//
//  TrainingScreen.swift
//  TrainingApp
//
//  Created by Ainur on 28.01.2023.
//

import Foundation
import UIKit
class TrainingScreen: UIViewController {
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var collectionView: UICollectionView!

    var tableViewData = [TrainingCellViewModel]()
    var levelData = [LevelCellViewModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let model1 = TrainingCellViewModel(title: "Arm ", imageName: "armMuscle")
        tableViewData.append(model1)
        
        let model2 = TrainingCellViewModel(title: "Legs ", imageName: "legsIcon")
        tableViewData.append(model2)
        
        let model3 = TrainingCellViewModel(title: "Cardio ", imageName: "cardioIcon")
        tableViewData.append(model3)
        
        let model4 = TrainingCellViewModel(title: "ABS ", imageName: "absIcon")
        tableViewData.append(model4)
        
        let model5 = TrainingCellViewModel(title: "Back ", imageName: "backIcon")
        tableViewData.append(model5)
        
        let model6 = TrainingCellViewModel(title: "Warm-up", imageName: "warm-upIcon")
        tableViewData.append(model6)

        levelData.append(LevelCellViewModel(imageName: "beginnerSplashImage", title: "Beginner", subtitle: "Light exercise. Ideal for beginner athletes"))
        
        levelData.append(LevelCellViewModel(imageName: "intermediateSplashImage", title: "Intermediate", subtitle: "Intermediate exercises. Suitable for advanced athletes"))
        
        levelData.append(LevelCellViewModel(imageName: "advancedSplashImage", title: "Advanced", subtitle: "Аdvanced exercises. Ideal for already experienced athletes"))
    }
}

extension TrainingScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        53
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrainingCell", for: indexPath) as! TrainingCell
        let model = tableViewData[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}
  
extension TrainingScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        levelData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCollectionCell", for: indexPath) as! LevelCollectionCell
        let model = levelData[indexPath.row]
        cell.configureWith(model: model)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.size.width , height: collectionView.frame.size.height)
    }
}
