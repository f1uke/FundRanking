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
    
    func setupView(fundInfo: FundInfo) {
        rank.text = "\(fundInfo.rank ?? 0)"
        name.text = fundInfo.thailandFundCode
        name.adjustsFontSizeToFitWidth = true
        name.minimumScaleFactor = 0.2
        name.numberOfLines = 1
        price.text = String(format: "%.2f", fundInfo.nav!)
        updateDate.text = AppUtils.dateToString(date: fundInfo.navDate!, pattern: .dmy)
        
        if fundInfo.avgReturn! > 0 {
            navAvgBG.backgroundColor = #colorLiteral(red: 0.3359633386, green: 0.8843305707, blue: 0.7025995851, alpha: 1)
            plusNavAvg.text = "+"
        } else {
            navAvgBG.backgroundColor = #colorLiteral(red: 0.9705815911, green: 0.5238886476, blue: 0.4260551333, alpha: 1)
            plusNavAvg.text = "-"
        }
        navAvg.text = "\(String(format: "%.2f", abs(fundInfo.avgReturn!)))%"
        
        if fundInfo.rank == 1 {
            crownImage.isHidden = false
        } else {
            crownImage.isHidden = true
        }
    }

}
