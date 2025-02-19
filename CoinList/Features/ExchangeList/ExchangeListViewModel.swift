//
//  ExchangeListViewModel.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import Foundation

class ExchangeListViewModel: ViewModelProtocol {
    //MARK: Properties
    let serviceFeature: ExchangeListService
    var exchangeList: [Exchange] = []
    
    //MARK: Lifecycle
    init(service: ServiceProtocol) {
        self.serviceFeature = ExchangeListService(service: service)
    }

    //MARK: Public functions
    func fetchExchanges() async throws {
        do {
            let response: [Exchange] = try await serviceFeature.fetchExchanges()
            exchangeList = response
        } catch(let error) {
            throw error
        }
    }
}
