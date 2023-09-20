//
//  StockModel.swift
//  CashApp-TakeHome
//
//  Created by Juan ceballos on 9/20/23.
//

import Foundation

struct StockModel: Decodable {
    let stocks: [Stock]
}

struct Stock: Decodable {
    let ticker: String
    let name: String
    let currency: String
    let current_price_cents: Int
    let quantity: Int?
    let current_price_timestamp: Int
}
