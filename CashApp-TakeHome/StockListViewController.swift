//
//  ViewController.swift
//  CashApp-TakeHome
//
//  Created by Juan ceballos on 9/20/23.
//

import UIKit

class StockListViewController: UIViewController {

    let mainView = StockListView()
    
    override func loadView() {
        view = mainView
    }
    
    let cashAppAPI = CashAppAPI()
    var stocks: [Stock] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        mainView.cv.dataSource = self
        
        Task {
            do {
                stocks = try await cashAppAPI.fetchParseStocks().stocks
                DispatchQueue.main.async {
                    self.mainView.cv.reloadData()
                }
            } catch {
                print("error: \(error)")
            }
        }
    }
    
    
}

extension StockListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stocks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StockListView.stockId, for: indexPath) as? StockCell else {
            fatalError()
        }
        cell.backgroundColor = .black
        let stock = stocks[indexPath.row]
        cell.configureCell(stickerName: stock.ticker, stockName: stock.name, stockCurrency: stock.currency, stockPrice: stock.current_price_cents, stockQuantity: stock.quantity, stockTimeStamp: stock.current_price_timestamp)
        return cell
    }
    
}
