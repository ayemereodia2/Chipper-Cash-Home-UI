//
//  TopOptionsView.swift
//  ChipperHome
//
//  Created by Ayemere  Odia  on 2022/10/20.
//

import UIKit

class TopOptionsViewCell: UITableViewCell {
    static let cellId = "TopOptionsViewCell"
    
    private var collectionView: UICollectionView!
    
    let cardView: CardView = {
        let view = CardView()
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 30
        return stackView
    }()
    
    let data = [
        ButtonModel(title: "Add Cash", color: UIColor.hexStringToUIColor(hex: "0013de"), image: UIImage(systemName: "banknote")),
        ButtonModel(title: "Buy Airtime", color: UIColor.hexStringToUIColor(hex: "529d31"), image: UIImage(systemName: "candybarphone")),
        ButtonModel(title: "Data Bundle", color: UIColor.hexStringToUIColor(hex: "f0973a"), image: UIImage(systemName: "phone")),
        ButtonModel(title: "Pay Bills", color: UIColor.red, image: UIImage(systemName: "doc.plaintext.fill")),
        ButtonModel(title: "Manage App", color: UIColor.hexStringToUIColor(hex: "bc4c8d"), image: UIImage(systemName: "bag"))
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 80)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    
        
        collectionView.register(ItemsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(collectionView)
        stackView.addArrangedSubview(cardView)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            collectionView.topAnchor.constraint(equalTo: stackView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 80),

            cardView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 40),
            cardView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            cardView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -10),
        ])
    }
}

extension TopOptionsViewCell {
    open override func addSubview(_ view: UIView) {
        super.addSubview(view)
        sendSubviewToBack(contentView)
    }
}

extension TopOptionsViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ItemsCollectionViewCell else {
            fatalError("Not implemented")
        }
        cell.configureCell(model: data[indexPath.row])
        return cell
    }
}


struct ButtonModel {
    let title: String
    let color: UIColor
    let image: UIImage?
}
