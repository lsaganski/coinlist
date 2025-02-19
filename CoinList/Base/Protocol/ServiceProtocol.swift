//
//  ServiceProtocol.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import Foundation

protocol ServiceProtocol {
    func get<T: Codable>(strUrl: String) async throws -> T
}
