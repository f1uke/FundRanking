//
//  Storyboards.swift
//  FundRanking
//
//  Created by Sattra on 9/14/21.
//

import Foundation
import UIKit

class Storyboards {
    
    enum ranking {
        static let storyboard = UIStoryboard(name: "Ranking", bundle: nil)
        static let rankingVC = "RankingViewController"
    }
    
    enum components {
        static let storyboard = UIStoryboard(name: "Components", bundle: nil)
        static let dialogErrorVC = "DialogErrorViewController"
    }
    
}
