//
//  ApiManager.swift
//  FundRanking
//
//  Created by Sattra on 9/14/21.
//

import Foundation
import Alamofire

class ApiManager<T: Codable> {
    
    static var shared: ApiManager<T> {
        get {
            return ApiManager<T>()
        }
    }
    
    func service(_ service: Service,
                 params: Parameters?,
                 completeHandler: ((GenericResponse<T>?) -> Void)!,
                 failureHandler: ((_ message: String) -> Void)!) {
        
        let headers: HTTPHeaders = [
        //  "Authorization": "Bearer \(accessToken)",
            "Content-Type": service.serviceConfig.requestContentType.rawValue
        ]
        
        self.service(service, params: params, headers: headers, completeHandler: completeHandler, failureHandler: failureHandler)
    }
    
    func service(_ service: Service,
                 params: Parameters?,
                 headers: HTTPHeaders,
                 completeHandler: ((_ response: GenericResponse<T>?) -> Void)!,
                 failureHandler: ((_ message: String) -> Void)!) {
        guard NetworkReachabilityManager()!.isReachable else {
            //            self.alertNetworkUnreachable()
            return
        }
        
        let url = service.serviceConfig.serviceUrl
        let method = service.serviceConfig.method
        var encode: ParameterEncoding {
            switch service.serviceConfig.requestContentType {
            case .json:
                return JSONEncoding.default
            default:
                return URLEncoding.default
            }
        }
        
        AF.request(url, method: method, parameters: params, encoding: encode, headers: headers)
            .responseJSON { (dataResponse) in
                guard let statusCode = dataResponse.response?.statusCode else {
                    print("\(url) not Response ")
                    failureHandler(Messages._serviceError)
                    return
                }
                
                switch statusCode {
                case 200..<300:
                    let response: GenericResponse<T>? = GenericResponse<T>.toGenericResponse(with: dataResponse.data)
                    completeHandler(response)
                case 401:
                    // renewAccessToken
                    break
                case 503:
                    // self.presentServiceUnavailable()
                    break
                default:
                    print("""
 url: \(url)
 statusCode: \(statusCode)
 """)
                }
            }
    }
}
