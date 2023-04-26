//
//  PersonalDetailsScreen.swift
//  TrainingApp
//
//  Created by Ainur on 26.04.2023.
//

import Foundation
import UIKit

class PersonalDetailsScreen: UIViewController {
    @IBOutlet private var wightStackView: UIStackView!
    @IBOutlet private var wightPickerView: UIPickerView!
    @IBOutlet private var dateStackView:  UIStackView!
    @IBOutlet private var datePickerView: UIDatePicker!
    @IBOutlet private var heightStackView: UIStackView!
    @IBOutlet private var heightPickerView: UIPickerView!
    private var weights = [Int]()
    private var heights = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weights = [0, 1, 2]
        wightPickerView.dataSource = self
        wightPickerView.delegate = self
        
        heightPickerView.dataSource = self
        heightPickerView.delegate = self
        heights = [0, 1, 2]
    }
}

extension PersonalDetailsScreen: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        weights.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        String(weights[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        NSAttributedString(string: String(weights[row]), attributes: [.foregroundColor: UIColor.white])
    }
}

