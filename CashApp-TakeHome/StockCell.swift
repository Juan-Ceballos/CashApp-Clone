//
//  StockCell.swift
//  CashApp-TakeHome
//
//  Created by Juan ceballos on 9/20/23.
//

import UIKit

class StockCell: UICollectionViewCell {
    
    static let symbolFontSize: CGFloat = 17
    static let detailsFontSize: CGFloat = 13
    static let itemSpacing: CGFloat = 11
    static let itemSmallPacing: CGFloat = 8
    static let itemLargePacing: CGFloat = 22
    static let cellContentMultiplier = 0.3
    static let noSpacing: CGFloat = 0
    
    override func layoutSubviews() {
        tickerView.layer.cornerRadius = tickerView.bounds.width / 2.0
        tickerView.clipsToBounds = true
    }
    
    public lazy var tickerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        let cellContentMultiplier = StockCell.cellContentMultiplier
        view.bounds = CGRect(x: StockCell.noSpacing, y: StockCell.noSpacing, width: contentView.bounds.width * cellContentMultiplier, height: contentView.bounds.width * cellContentMultiplier)
        return view
    }()
    
    var tickerLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: symbolFontSize)
        label.textColor = .systemBackground
        return label
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: detailsFontSize)
        return label
    }()
    
    var currencyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: detailsFontSize)
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: detailsFontSize)
        return label
    }()
    
    var quantityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: detailsFontSize)
        return label
    }()
    
    var stockTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: detailsFontSize)
        return label
    }()
    
    func configureCell(stickerName: String, stockName: String, stockCurrency: String,
                       stockPrice: Int, stockQuantity: Int?, stockTimeStamp: Int) {
        let defaultQuantity = 0
        let dollarMultiplier = 100.0
        tickerLabel.text = stickerName
        nameLabel.text = stockName
        currencyLabel.text = "\(stockCurrency):"
        
        let priceInCents = stockPrice
        let priceDollars = Double(priceInCents) / dollarMultiplier
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        priceLabel.text = formatter.string(from: NSNumber(value: priceDollars))
        
        quantityLabel.text = "Quantity: \(stockQuantity ?? defaultQuantity)"
        
        let date = Date(timeIntervalSince1970: Double(stockTimeStamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let utcDateString = dateFormatter.string(from: date)
        stockTimeLabel.text = "As of: \(utcDateString)"
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commoninit()
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
            tickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: StockCell.itemSpacing),
            tickerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            tickerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: StockCell.cellContentMultiplier),
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
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: StockCell.itemLargePacing),
            nameLabel.leadingAnchor.constraint(equalTo: tickerView.trailingAnchor, constant: StockCell.itemSpacing)
        ])
    }
    
    private func setupCurrencyLabelConstraints() {
        addSubview(currencyLabel)
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currencyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: StockCell.itemSmallPacing),
            currencyLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        
        ])
    }
    
    private func setupPriceLabelConstraints() {
        addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: currencyLabel.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: currencyLabel.trailingAnchor, constant: StockCell.itemSmallPacing)
        ])
    }
    
    private func setupQuantityLabelConstraints() {
        addSubview(quantityLabel)
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: StockCell.itemSmallPacing),
            quantityLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
    }
    
    private func setupTimeLabelConstraints() {
        addSubview(stockTimeLabel)
        stockTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stockTimeLabel.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: StockCell.itemSpacing),
            stockTimeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
    }
    
}
