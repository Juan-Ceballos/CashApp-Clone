//
//  StockCell.swift
//  CashApp-TakeHome
//
//  Created by Juan ceballos on 9/20/23.
//

import UIKit

class StockCell: UICollectionViewCell {
    
    override func layoutSubviews() {
        tickerView.layer.cornerRadius = tickerView.bounds.width / 2.0
        tickerView.clipsToBounds = true
    }
    
    public lazy var tickerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.bounds = CGRect(x: 0, y: 0, width: contentView.bounds.width * 0.3, height: contentView.bounds.width * 0.3)
        return view
    }()
    
    var tickerLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .systemBackground
        return label
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        return label
    }()
    
    var currencyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        return label
    }()
    
    var quantityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        return label
    }()
    
    var stockTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commoninit()
    }
    
    func configureCell(stickerName: String, stockName: String, stockCurrency: String,
                       stockPrice: Int, stockQuantity: Int?, stockTimeStamp: Int) {
        tickerLabel.text = stickerName
        nameLabel.text = stockName
        currencyLabel.text = "\(stockCurrency):"
        
        let priceInCents = stockPrice
        let priceDollars = Double(priceInCents) / 100.0
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        priceLabel.text = formatter.string(from: NSNumber(value: priceDollars))
        
        quantityLabel.text = "Quantity: \(stockQuantity ?? 0)"
        
        let date = Date(timeIntervalSince1970: Double(stockTimeStamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let utcDateString = dateFormatter.string(from: date)
        stockTimeLabel.text = "As of: \(utcDateString)"
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commoninit()
    }
    
    private func commoninit() {
        setupTickerViewConstraints()
        setupTickerLabelConstraints()
        setupNameLabelConstraints()
        setupCurrencyLabelConstraints()
        setupPriceLabelConstraints()
        setupQuantityLabelConstraints()
        setupTimeLabelConstraints()
    }
    
    private func setupTickerViewConstraints() {
        addSubview(tickerView)
        tickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            tickerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            tickerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            tickerView.heightAnchor.constraint(equalTo: tickerView.widthAnchor)
        ])
    }
    
    private func setupTickerLabelConstraints() {
        addSubview(tickerLabel)
        tickerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tickerLabel.centerYAnchor.constraint(equalTo: tickerView.centerYAnchor),
            tickerLabel.centerXAnchor.constraint(equalTo: tickerView.centerXAnchor)
        ])
    }
    
    private func setupNameLabelConstraints() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            nameLabel.leadingAnchor.constraint(equalTo: tickerView.trailingAnchor, constant: 11)
        ])
    }
    
    private func setupCurrencyLabelConstraints() {
        addSubview(currencyLabel)
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currencyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            currencyLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        
        ])
    }
    
    private func setupPriceLabelConstraints() {
        addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: currencyLabel.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: currencyLabel.trailingAnchor, constant: 8)
        ])
    }
    
    private func setupQuantityLabelConstraints() {
        addSubview(quantityLabel)
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 8),
            quantityLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
    }
    
    private func setupTimeLabelConstraints() {
        addSubview(stockTimeLabel)
        stockTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stockTimeLabel.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 8),
            stockTimeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
    }
    
}
