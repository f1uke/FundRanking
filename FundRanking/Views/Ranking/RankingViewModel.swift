//
//  RankingViewModel.swift
//  FundRanking
//
//  Created by Sattra on 9/17/21.
//

import Foundation
import RxSwift
import RxCocoa

class RankingViewModel {
    
    init(onErrorResponse: ((String) -> Void)?,
         onSuccess: (() -> Void)? ) {
        self.onErrorResponse = onErrorResponse
        self.onSuccess = onSuccess
    }
    
    let onErrorResponse: ((String) -> Void)?
    let onSuccess: (() -> Void)?
    
    var fundInfos: [FundInfo]?
    var tempFundInfos = PublishSubject<[FundInfo]>()
    
    func getFundRankingDay() {
        Repository.getFundRankingDay(onComplete: { datas in
            let sortedData = self.sortRanking(datas)
            self.fundInfos = sortedData
            self.tempFundInfos.onNext(sortedData)
            self.onSuccess?()
        }, onFailure: self.onErrorResponse)
    }
    
    func getFundRankingWeek() {
        Repository.getFundRankingWeek(onComplete: { datas in
            let sortedData = self.sortRanking(datas)
            self.fundInfos = sortedData
            self.tempFundInfos.onNext(sortedData)
            self.onSuccess?()
        }, onFailure: self.onErrorResponse)
    }
    
    func getFundRankingMonth() {
        Repository.getFundRankingMonth(onComplete: { datas in
            let sortedData = self.sortRanking(datas)
            self.fundInfos = sortedData
            self.tempFundInfos.onNext(sortedData)
            self.onSuccess?()
        }, onFailure: self.onErrorResponse)
    }
    
    func getFundRankingYear() {
        Repository.getFundRankingYear(onComplete: { datas in
            let sortedData = self.sortRanking(datas)
            self.fundInfos = sortedData
            self.tempFundInfos.onNext(sortedData)
            self.onSuccess?()
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
