//
//  GenericResponse.swift
//  FundRanking
//
//  Created by Sattra on 9/14/21.
//

import Foundation

class GenericResponse<T: Codable>: Decodable {
    var status: Bool?
    var error: String?
//    var datas: [T]?
    var data: [T]?
    
    static func toGenericResponse(with data: Data?) -> GenericResponse<T>? {
        guard let dataGeneric = data else {
            return nil
        }
        do {
            let genericResponse:GenericResponse<T> = try JSONDecoder().decode(self, from: dataGeneric)
            return genericResponse
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case status
        case error
//        case datas
        case data
    }
    
    init() {
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decodeIfPresent(Bool.self, forKey: .status)
        error = try container.decodeIfPresent(String.self, forKey: .error)
//        datas = try container.decodeIfPresent([T].self, forKey: .datas)
        data = try container.decodeIfPresent([T].self, forKey: .data)
        
    }
}
