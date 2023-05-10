//
//  PersonalDetailsScreen.swift
//  TrainingApp
//
//  Created by Ainur on 26.04.2023.
//

import Foundation
import UIKit

class PersonalDetailsScreen: UIViewController {
    enum ViewStep {
        case weight
        case date
        case height
        case hello
    }
    @IBOutlet private var helloView: UIView!
    @IBOutlet private var weightStackView: UIStackView!
    @IBOutlet private var dateStackView:  UIStackView!
    @IBOutlet private var heightStackView: UIStackView!

    @IBOutlet private var weightPickerView: UIPickerView!
    @IBOutlet private var datePickerView: UIDatePicker!
    @IBOutlet private var heightPickerView: UIPickerView!
    
    private var weights = [Int]()
    private var heights = [Int]()
    
    private var selectedWeight: Int? 
    private var selectedDate: Date?
    private var selectedHeight: Int?

    
    private var nextViewStep = ViewStep.weight {
        didSet {
            switch nextViewStep {
            case .hello:
                helloView.isHidden = false
                weightStackView.isHidden = true
                dateStackView.isHidden = true
                heightStackView.isHidden = true
            case .weight:
                helloView.isHidden = true
                weightStackView.isHidden = false
                dateStackView.isHidden = true
                heightStackView.isHidden = true
            case .date:
                helloView.isHidden = true
                weightStackView.isHidden = true
                dateStackView.isHidden = false
                heightStackView.isHidden = true
            case .height:
                helloView.isHidden = true
                weightStackView.isHidden = true
                dateStackView.isHidden = true
                heightStackView.isHidden = false
            }
        }
    }
    
    private var backViewStep = ViewStep.weight {
        didSet {
            switch backViewStep {
            case .hello:
                helloView.isHidden = false
                weightStackView.isHidden = true
                dateStackView.isHidden = true
                heightStackView.isHidden = true
            case .weight:
                helloView.isHidden = false
                weightStackView.isHidden = true
                dateStackView.isHidden = true
                heightStackView.isHidden = true
            case .date:
                helloView.isHidden = true
                weightStackView.isHidden = false
                dateStackView.isHidden = true
                heightStackView.isHidden = true
            case .height:
                helloView.isHidden = true
                weightStackView.isHidden = true
                dateStackView.isHidden = false
                heightStackView.isHidden = true
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        weights = Array(30...300)
        weightPickerView.dataSource = self
        weightPickerView.delegate = self
        weightPickerView.selectRow(30, inComponent: 0, animated: false)
        
        heightPickerView.dataSource = self
        heightPickerView.delegate = self
        heightPickerView.selectRow(30, inComponent: 0, animated: false)
        heights = Array(100...300)
        
        nextViewStep = .hello
    }
    @IBAction func nextButtonPressed() {
        switch nextViewStep {
        case .hello:
            nextViewStep = .weight
        case .weight:
            nextViewStep = .date
        case .date:
            nextViewStep = .height
        case .height:
            nextViewStep = .height
        }
    }
    
    @IBAction func backButtonPressed() {
        switch backViewStep {
        case .hello:
            backViewStep = .hello
        case .weight:
            backViewStep = .hello
        case .date:
            backViewStep = .weight
        case .height:
            backViewStep = .date
        }
    }
    
    @IBAction func dateChanged() {
        print(datePickerView.date)
        selectedDate = datePickerView.date
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
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == weightPickerView {
            selectedWeight = weights[row]
        } else if pickerView == heightPickerView {
            selectedHeight = heights[row]
        }
    }
}

 
