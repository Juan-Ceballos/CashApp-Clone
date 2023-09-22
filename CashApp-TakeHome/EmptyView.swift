//
//  EmptyView.swift
//  CashApp-TakeHome
//
//  Created by Juan ceballos on 9/21/23.
//

import UIKit

class EmptyView: UIView {

    public lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "No Stocks"
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
        setupEmptyLabelConstraints()
    }
    
    private func setupEmptyLabelConstraints() {
        addSubview(emptyLabel)
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emptyLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            emptyLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            emptyLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        ])
    }
}

