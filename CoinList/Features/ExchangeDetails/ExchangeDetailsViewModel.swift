//
//  ExchangeDetailsViewModel.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import Foundation

class ExchangeDetailsViewModel: ViewModelProtocol {
    //MARK: Properties
    var exchange: Exchange?

    //MARK: Public functions
    func setData(exchange: Exchange) {
        self.exchange = exchange
    }
}
