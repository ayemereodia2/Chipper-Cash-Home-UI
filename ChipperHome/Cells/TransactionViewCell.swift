//
//  TransactionViewCell.swift
//  ChipperHome
//
//  Created by Ayemere  Odia  on 2022/10/21.
//

import UIKit

class TransactionViewCell: UITableViewCell {
    static let cellId = "TransactionViewCell"
    
    let circleView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let amountLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let transactionLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let transactionDateLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let transactionDescriptionLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        circleView.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        transactionLabel.translatesAutoresizingMaskIntoConstraints = false
        transactionDateLabel.translatesAutoresizingMaskIntoConstraints = false
        transactionDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
