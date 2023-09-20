//
//  CashAppAPI.swift
//  CashApp-TakeHome
//
//  Created by Juan ceballos on 9/20/23.
//

import Foundation

struct CashAppAPI {
    static let baseURL = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json"
    
    func fetchParseStocks() async throws -> StockModel {
        let url = URL(string: CashAppAPI.baseURL)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        
        return try decoder.decode(StockModel.self, from: data)
    }
}
