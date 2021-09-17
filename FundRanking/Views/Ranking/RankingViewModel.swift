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
            self.fundInfos = self.sortRanking(datas)
            onSuccess?()
        }, onFailure: self.onErrorResponse)
    }
    
    func getFundRankingWeek(onSuccess: ( () -> Void )?) {
        Repository.getFundRankingWeek(onComplete: { datas in
            self.fundInfos = self.sortRanking(datas)
            onSuccess?()
        }, onFailure: self.onErrorResponse)
    }
    
    func getFundRankingMonth(onSuccess: ( () -> Void )?) {
        Repository.getFundRankingMonth(onComplete: { datas in
            self.fundInfos = self.sortRanking(datas)
            onSuccess?()
        }, onFailure: self.onErrorResponse)
    }
    
    func getFundRankingYear(onSuccess: ( () -> Void )?) {
        Repository.getFundRankingYear(onComplete: { datas in
            self.fundInfos = self.sortRanking(datas)
            onSuccess?()
        }, onFailure: self.onErrorResponse)
    }
    
    private func sortRanking(_ fundInfos: [FundInfo]?) -> [FundInfo] {
        guard let _ = fundInfos else {
            return []
        }
        
        var fundInfosSorted = fundInfos?.sorted(by: { $0.avgReturn! >= $1.avgReturn! })
        
        for (index, _) in fundInfosSorted!.enumerated() {
            fundInfosSorted![index].rank = index + 1
        }
        
        return fundInfosSorted ?? []
    }
    
}
