//
//  ItemsCollectionViewCell.swift
//  ChipperHome
//
//  Created by Ayemere  Odia  on 2022/10/21.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
    private let minibutton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 23
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 8
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray.withAlphaComponent(0.5)
        return label
    }()
    
    private let stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    func configureCell(model: ButtonModel) {
        titleLabel.text = model.title
        minibutton.setImage(model.image, for: .normal)
        minibutton.tintColor = .white
        minibutton.backgroundColor = model.color
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        minibutton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        stackView.addArrangedSubview(minibutton)
        stackView.addArrangedSubview(titleLabel)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            minibutton.heightAnchor.constraint(equalToConstant: 44),
            minibutton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
