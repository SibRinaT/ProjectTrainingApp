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
    var tableViewData = [TrainingCellViewModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.delegate = self
        tableView.dataSource = self
        
        let model1 = TrainingCellViewModel(title: "Arm training", imageName: "armMuscle")
        tableViewData.append(model1)
        
        let model2 = TrainingCellViewModel(title: "Legs training", imageName: "legsIcon")
        tableViewData.append(model2)
        
        let model3 = TrainingCellViewModel(title: "Cardio training", imageName: "cardioIcon")
        tableViewData.append(model3)

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
  
