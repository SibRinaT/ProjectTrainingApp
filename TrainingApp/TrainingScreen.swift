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
    @IBOutlet private var pageControl: UIPageControl!
    @IBOutlet private var addTrainingView: UIView!
    

    var tableViewData = [TrainingCellViewModel]()
    var filteredTableViewData = [TrainingCellViewModel]()
    var levelData = [LevelCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let model1 = TrainingCellViewModel(title: "Arm ", imageName: "armMuscle", level: .beginner)
        tableViewData.append(model1)
        
        let model2 = TrainingCellViewModel(title: "Legs ", imageName: "legsIcon", level: .beginner)
        tableViewData.append(model2)
        
        let model3 = TrainingCellViewModel(title: "Cardio ", imageName: "cardioIcon", level: .mytraining)
        tableViewData.append(model3)
        
        let model4 = TrainingCellViewModel(title: "ABS ", imageName: "absIcon", level: .intermediate)
        tableViewData.append(model4)
        
        let model5 = TrainingCellViewModel(title: "Back ", imageName: "backIcon", level: .intermediate)
        tableViewData.append(model5)
        
        let model6 = TrainingCellViewModel(title: "Warm-up", imageName: "warm-upIcon", level: .advanced)
        tableViewData.append(model6)
        
        let model7 = TrainingCellViewModel(title: "Arm ", imageName: "armMuscle", level: .advanced)
        tableViewData.append(model7)

        levelData.append(LevelCellViewModel(imageName: "beginnerSplashImage", title: "Beginner", subtitle: "Light exercise. Ideal for beginner athletes", level: .beginner))
        
        levelData.append(LevelCellViewModel(imageName: "intermediateSplashImage", title: "Intermediate", subtitle: "Intermediate exercises. Suitable for advanced athletes", level: .intermediate))
        
        levelData.append(LevelCellViewModel(imageName: "advancedSplashImage", title: "Advanced", subtitle: "Аdvanced exercises. Ideal for already experienced athletes", level: .advanced))
        
        levelData.append(LevelCellViewModel(imageName: "mytrainingSplashImage", title: "My traing", subtitle: "This is an ideal place for those who are ready to do their own set of exercises", level: .mytraining))
   
        filteredTableViewData = tableViewData.filter{ $0.level == .beginner }
        tableView.reloadData()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension TrainingScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredTableViewData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        53
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrainingCell", for: indexPath) as! TrainingCell
        let model = filteredTableViewData[indexPath.row]
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
     

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)

        if scrollView == collectionView {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { [weak self] in
                guard let sSelf = self else { return }
                if let cell = sSelf.collectionView.visibleCells.first,  let ip = sSelf.collectionView.indexPath(for: cell)
                {
                    if let cell = cell as? LevelCollectionCell, cell.level == .mytraining {
                        self?.addTrainingView.isHidden = false
                    } else {
                        self?.addTrainingView.isHidden = true
                    }
                    sSelf.filteredTableViewData = sSelf.tableViewData.filter{ $0.level == TrainingLevel(rawValue: ip.item)}
                }
                sSelf.tableView.reloadData()
            }
        }
    }
}
