//
//  CoinListTests.swift
//  CoinListTests
//
//  Created by Leonardo Saganski on 17/02/25.
//

import XCTest
@testable import CoinList

final class CoinListTests: XCTestCase {

    func testFetchExchanges() throws {
        let viewModel = ExchangeListViewModel(service: ServiceMock())
        Task {
            do {
                try await viewModel.fetchExchanges()
                assert(viewModel.exchangeList.count == 18, "Failed: number of items in excahnge list is incorrect")
                assert(viewModel.exchangeList.last?.name ?? "" == "BitMEX", "Failed: name of last Exchange isn't the expected one")
            } catch {
                XCTFail("Something wrong")
            }
        }
    }
}
