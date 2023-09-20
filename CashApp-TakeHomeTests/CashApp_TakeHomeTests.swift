//
//  CashApp_TakeHomeTests.swift
//  CashApp-TakeHomeTests
//
//  Created by Juan ceballos on 9/20/23.
//

import XCTest
@testable import CashApp_TakeHome

final class CashApp_TakeHomeTests: XCTestCase {

    func testCashAppAPIFetchParseStocks() async {
        let exp = XCTestExpectation(description: "Stock data fetched and parsed")
        let cashAppAPI = CashAppAPI()
        let expectedMinStockCount = 5
        
        Task {
            do {
                let stocks = try await cashAppAPI.fetchParseStocks()
                let stocksCount = stocks.stocks.count
                XCTAssertGreaterThanOrEqual(stocksCount, expectedMinStockCount, "expected min count of stocks, \(expectedMinStockCount), is not less than or equal to the current count of stocks, \(stocksCount).")
                exp.fulfill()
            } catch {
                XCTFail("failed to fetch and/or parse stock data due to error: \(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10.0)
    }
}
