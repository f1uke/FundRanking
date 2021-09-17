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
    
    class func getFundRankingWeek(onComplete completeHandler: (([FundInfo]?) -> Void)!,
                                 onFailure failureHandler: ((_ message: String) -> Void)!){
        
        ApiManager<FundInfo>.shared.service(.getFundRankingWeek, params: nil, completeHandler: { (response) in
            completeHandler(response?.data)
        }, failureHandler: failureHandler)
    }
    
    class func getFundRankingMonth(onComplete completeHandler: (([FundInfo]?) -> Void)!,
                                 onFailure failureHandler: ((_ message: String) -> Void)!){
        
        ApiManager<FundInfo>.shared.service(.getFundRankingMonth, params: nil, completeHandler: { (response) in
            completeHandler(response?.data)
        }, failureHandler: failureHandler)
    }
    
    class func getFundRankingYear(onComplete completeHandler: (([FundInfo]?) -> Void)!,
                                 onFailure failureHandler: ((_ message: String) -> Void)!){
        
        ApiManager<FundInfo>.shared.service(.getFundRankingYear, params: nil, completeHandler: { (response) in
            completeHandler(response?.data)
        }, failureHandler: failureHandler)
    }
    
}
