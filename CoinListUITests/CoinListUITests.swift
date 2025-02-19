//
//  CoinListUITests.swift
//  CoinListUITests
//
//  Created by Leonardo Saganski on 17/02/25.
//

import XCTest

final class CoinListUITests: XCTestCase {
    @MainActor
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        let list: XCUIElement = app.tables[Constants.Testing.exchangeList]
        if list.waitForExistence(timeout: 10.0) {
            let cell = list.cells.element (boundBy: 0)
            cell.tap()
            let nameLabel: XCUIElement = app.staticTexts[Constants.Testing.exchangeName]
            if nameLabel.waitForExistence(timeout: 5.0) {
                assert(nameLabel.exists, "Failed: the name field was not found in the Details page.")
                assert(!nameLabel.label.isEmpty && nameLabel.label == "Binance", "Failed, the exchange name was not displayed in the Details page or it was not the expected one.")
            } else {
                XCTFail("Failed: The Details page didn't appear.")
            }
        } else {
            XCTFail("Failed: There's no Exchange List!")
        }
    }
}
