//
//  ExchangeModel.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import Foundation

struct Exchange: Codable {
    let exchange_id: String?
    let name: String?
    let volume_1hrs_usd: Double?
    let volume_1day_usd: Double?
    let volume_1mth_usd: Double?
    let data_trade_start: String?
    let data_trade_end: String?
    let website: String?
}
