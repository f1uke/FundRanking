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
        if let navDate = try container.decodeIfPresent(String.self, forKey: .navDate) {
            if let date = AppUtils.stringToDate(dateString: navDate, pattern: .timestamp, locale: LocaleDateTime.en) {
                self.navDate = date
            }
        }
        avgReturn = try container.decodeIfPresent(Double.self, forKey: .avgReturn)
    }
}
