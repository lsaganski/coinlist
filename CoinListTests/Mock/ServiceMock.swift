//
//  ServiceMock.swift
//  CoinList
//
//  Created by Leonardo Saganski on 18/02/25.
//

import Foundation

class ServiceMock: ServiceProtocol {
    func get<T: Codable>(strUrl: String) async throws -> T {
        let jsonFileName = Constants.urlMock[strUrl] ?? ""
        guard let data = JSONHelper().readJSONFile(name: jsonFileName) else {
            throw ServiceError.unknownError
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch {
            throw ServiceError.unknownError
        }
    }
}
