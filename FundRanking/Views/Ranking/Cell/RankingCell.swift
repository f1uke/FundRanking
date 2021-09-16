//
//  RankingCell.swift
//  FundRanking
//
//  Created by Sattra on 9/16/21.
//

import UIKit

class RankingCell: UITableViewCell {
    
    static let cellId = "RankingCell"
    
    @IBOutlet weak var crownImage: UIImageView!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var updateDate: UILabel!
    @IBOutlet weak var navAvgBG: UICustomView!
    @IBOutlet weak var plusNavAvg: UILabel!
    @IBOutlet weak var navAvg: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
