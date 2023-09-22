//
//  CashApp_TakeHomeTests.swift
//  CashApp-TakeHomeTests
//
//  Created by Juan ceballos on 9/20/23.
//

import XCTest
@testable import CashApp_TakeHome

final class CashApp_TakeHomeTests: XCTestCase {
    
    func testCashAppAPIFetchData() async {
        let exp = XCTestExpectation(description: "Fetched data")
        let cashAppAPI = CashAppAPI()
        let urlString = CashAppAPI.baseURL
        let expectedDataCount = 400
        
        Task {
            do {
                let url = URL(string: urlString)!
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                let (data, _) = try await URLSession.shared.data(for: request)
                let dataCount = data.count
                XCTAssertGreaterThan(dataCount, expectedDataCount, "data count \(dataCount), greater than expected data count \(expectedDataCount)")
                exp.fulfill()
            } catch {
                XCTFail("failed to fetch data due to error: \(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10.0)
    }

    func testCashAppAPIFetchParseStocks() async {
        let exp = XCTestExpectation(description: "Stock data fetched and parsed")
        let cashAppAPI = CashAppAPI()
        let expectedMinStockCount = 1
        
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
    
    func testCashAppAPIFetchParseStocksEmpty() async {
        let exp = XCTestExpectation(description: "Fetched data")
        let cashAppAPI = CashAppAPI()
        let urlString = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_empty.json"
        let expectedStockCount = 0
        
        Task {
            do {
                let url = URL(string: urlString)!
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                let emptyStocks = try decoder.decode(StockModel.self, from: data)
                let emptyStocksCount = emptyStocks.stocks.count
                XCTAssertEqual(emptyStocksCount, expectedStockCount, "stock count \(emptyStocks), equal to expected stock count \(expectedStockCount)")
                exp.fulfill()
            } catch {
                XCTFail("failed to fetch data due to error: \(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10.0)
    }
}
