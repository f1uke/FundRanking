//
//  FundInfo.swift
//  FundRanking
//
//  Created by Sattra on 9/17/21.
//

import Foundation

struct FundInfo: Codable {
    var rank: Int?
    var masterId: String?
    var thailandFundCode: String?
    var navReturn: Double?
    var nav: Double?
    var navDate: Date?
    var avgReturn: Double?
    
    enum CodingKeys: String, CodingKey {
        case rank
        case masterId = "mstar_id"
        case thailandFundCode = "thailand_fund_code"
        case navReturn = "nav_return"
        case nav
        case navDate = "nav_date"
        case avgReturn = "avg_return"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rank = try container.decodeIfPresent(Int.self, forKey: .rank)
        masterId = try container.decodeIfPresent(String.self, forKey: .masterId)
        thailandFundCode = try container.decodeIfPresent(String.self, forKey: .thailandFundCode)
        navReturn = try container.decodeIfPresent(Double.self, forKey: .navReturn)
        nav = try container.decodeIfPresent(Double.self, forKey: .nav)
        if let navDate = try container.decodeIfPresent(String.self, forKey: .navDate){
            let dateFormatter = DateFormatter()
            dateFormatter.locale = LocaleDateTime.en
            dateFormatter.dateFormat = PatternDateFormatter.timestamp.rawValue
            if let date = dateFormatter.date(from: navDate) {
                self.navDate = date
            }
        }
        avgReturn = try container.decodeIfPresent(Double.self, forKey: .avgReturn)
    }
    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encodeIfPresent(rank, forKey: .rank)
//        try container.encodeIfPresent(masterId, forKey: .masterId)
//        try container.encodeIfPresent(thailandFundCode, forKey: .thailandFundCode)
//        try container.encodeIfPresent(navReturn, forKey: .navReturn)
//        if let navDate = self.navDate {
//            try container.encodeIfPresent(navDate.timeIntervalSince1970 * 1000, forKey: .navDate)
//        }
//        try container.encodeIfPresent(avgReturn, forKey: .avgReturn)
//    }
}
