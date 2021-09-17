//
//  ApiConfig.swift
//  FundRanking
//
//  Created by Sattra on 9/14/21.
//

import Foundation
import Alamofire

enum Root: String {
    case serviceHost
}

enum ContentType: String{
    case none = "**"
    case json = "application/json;charset=UTF-8"
    case multipart = "multipart/form-data"
    case octetStream = "application/octet-stream;charset=UTF-8"
    case form = "application/x-www-form-urlencoded;charset=UTF-8"
}

enum Service {
    case getFundRankingDay
    case getFundRankingWeek
    case getFundRankingMonth
    case getFundRankingYear
}

extension Service {
    var serviceConfig: ServiceConfig {
        switch self {
        case .getFundRankingDay:
            return ServiceConfig(root: .serviceHost,
                                 service: "fund-ranking-1D.json",
                                 method: .get,
                                 requestContentType: .none)
        case .getFundRankingWeek:
            return ServiceConfig(root: .serviceHost,
                                 service: "fund-ranking-1W.json",
                                 method: .get,
                                 requestContentType: .none)
        case .getFundRankingMonth:
            return ServiceConfig(root: .serviceHost,
                                 service: "fund-ranking-1M.json",
                                 method: .get,
                                 requestContentType: .none)
        case .getFundRankingYear:
            return ServiceConfig(root: .serviceHost,
                                 service: "fund-ranking-1Y.json",
                                 method: .get,
                                 requestContentType: .none)
        }
        
    }
}

extension Service {
    class ServiceConfig {
        let serviceUrl: String
        let servicePath: String
        let method: HTTPMethod
        let requestContentType: ContentType
        
        init(root: Root, service: String, method: HTTPMethod, requestContentType: ContentType) {
            var apiContextRoot = ""
            switch root {
            case .serviceHost:
                apiContextRoot = (Bundle.main.object(forInfoDictionaryKey: "SERVICE_HOST") as! String)
            }
            self.serviceUrl = "\(apiContextRoot)\(service)"
            self.servicePath = service
            self.method = method
            self.requestContentType = requestContentType
        }
    }
}
