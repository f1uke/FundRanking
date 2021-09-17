//
//  Repository.swift
//  FundRanking
//
//  Created by Sattra on 9/14/21.
//

import Foundation

class Repository {
    
    class func getFundRankingDay(onComplete completeHandler: (([FundInfo]?) -> Void)!,
                                 onFailure failureHandler: ((_ message: String) -> Void)!){
        
        ApiManager<FundInfo>.shared.service(.getFundRankingDay, params: nil, completeHandler: { (response) in
            completeHandler(response?.data)
        }, failureHandler: failureHandler)
    }
    
}
