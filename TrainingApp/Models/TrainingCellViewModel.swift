//
//  TrainingCellViewModel.swift
//  TrainingApp
//
//  Created by Ainur on 16.02.2023.
//

import Foundation
struct TrainingCellViewModel {
    let title: String
    let imageName: String
    let level: TrainingLevel
}

enum TrainingLevel: Int {
    case beginner = 0
    case intermediate = 1
    case advanced = 2
    
    var lightningImageName: String {
        switch self {
        case .beginner:
            return "lightningBegginer"
        case .intermediate:
            return "lightningInter"
        case .advanced:
            return "lightningAdvanced"
        }
    }
}
