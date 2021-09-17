//
//  RankingViewModel.swift
//  FundRanking
//
//  Created by Sattra on 9/17/21.
//

import Foundation

class RankingViewModel {
    
    init(onErrorResponse: ((String) -> Void)?) {
        self.onErrorResponse = onErrorResponse
    }
    
    let onErrorResponse: ((String) -> Void)?
    
    var fundInfos: [FundInfo]?
    
    func getFundRankingDay(onSuccess: ( () -> Void )?) {
        Repository.getFundRankingDay(onComplete: { datas in
            self.fundInfos = datas
            onSuccess?()
        }, onFailure: self.onErrorResponse)
    }
    
    func getFundRankingWeek(onSuccess: ( () -> Void )?) {
        Repository.getFundRankingWeek(onComplete: { datas in
            self.fundInfos = datas
            onSuccess?()
        }, onFailure: self.onErrorResponse)
    }
    
    func getFundRankingMonth(onSuccess: ( () -> Void )?) {
        Repository.getFundRankingMonth(onComplete: { datas in
            self.fundInfos = datas
            onSuccess?()
        }, onFailure: self.onErrorResponse)
    }
    
    func getFundRankingYear(onSuccess: ( () -> Void )?) {
        Repository.getFundRankingYear(onComplete: { datas in
            self.fundInfos = datas
            onSuccess?()
        }, onFailure: self.onErrorResponse)
    }
    
}
