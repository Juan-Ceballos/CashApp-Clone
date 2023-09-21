//
//  StockListView.swift
//  CashApp-TakeHome
//
//  Created by Juan ceballos on 9/20/23.
//

import UIKit

class StockListView: UIView {
    static let stockId = "stockId"
    
    public lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.33, height: UIScreen.main.bounds.width * 0.33)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(StockCell.self, forCellWithReuseIdentifier: StockListView.stockId)
        cv.backgroundColor = .black
        cv.contentInset = UIEdgeInsets(top: 0, left: 11, bottom: 0, right: UIScreen.main.bounds.width * 0.65)
        return cv
    }()
    
    public lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Portfolio"
        label.font = .boldSystemFont(ofSize: 33)
        label.textColor = .systemBackground
        label.textAlignment = .center
        label.backgroundColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commoninit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commoninit()
    }
    
    private func commoninit() {
        setupHeaderLabelConstraints()
        setupCVConstraints()
    }
    
    private func setupHeaderLabelConstraints() {
        addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            headerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
            
        ])
    }
    
    private func setupCVConstraints() {
        addSubview(cv)
        cv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            cv.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            cv.leadingAnchor.constraint(equalTo: leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
