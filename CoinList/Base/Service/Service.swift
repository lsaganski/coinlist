//
//  Service.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import Foundation

class Service: ServiceProtocol {
    //MARK: Public functions
    func get<T: Codable>(strUrl: String) async throws -> T {
        guard let url = URL(string: Constants.URL.baseUrl + strUrl) else {
            throw ServiceError.urlError
        }
        
        var request = URLRequest(url: url, timeoutInterval: 10.0)
        request.addValue(Constants.URL.apiKey, forHTTPHeaderField: "X-CoinAPI-Key")
        
        let (data, response) = try await URLSession.shared.data(for: request)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ServiceError.requestError
        }
        
        guard let parsedData = try? JSONDecoder().decode(T.self, from: data) else {
            throw ServiceError.decodingError
        }
        
        return parsedData
    }
}
