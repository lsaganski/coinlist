//
//  ExchangeListService.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import Foundation

class ExchangeListService {
    //MARK: Properties
    let service: ServiceProtocol
    
    //MARK: Lifecycle
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    //MARK: Public functions
    func fetchExchanges() async throws -> [Exchange] {
        let url = String(format: Constants.URL.listExchanges)
        do {
            return try await service.get(strUrl: url)
        } catch(let error) {
            throw error
        }
    }
}
