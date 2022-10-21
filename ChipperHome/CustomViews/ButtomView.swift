//
//  ButtomView.swift
//  ChipperHome
//
//  Created by Ayemere  Odia  on 2022/10/19.
//

import UIKit

class ButtomView: UIView {

    private let sendButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let requestButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        requestButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        stackView.addArrangedSubview(requestButton)
        stackView.addArrangedSubview(sendButton)

        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        sendButton.setTitle("Send", for: .normal)
        sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        sendButton.backgroundColor = UIColor.hexStringToUIColor(hex: "700CB3")
        sendButton.layer.borderWidth = 1
        sendButton.layer.cornerRadius = 12
        sendButton.layer.borderColor = UIColor.hexStringToUIColor(hex: "700CB3").cgColor

        requestButton.layer.borderWidth = 1
        requestButton.layer.cornerRadius = 12
        requestButton.backgroundColor = .white
        requestButton.setTitle("Request", for: .normal)
        requestButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        requestButton.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.7).cgColor
        requestButton.setTitleColor(.black, for: .normal)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            requestButton.widthAnchor.constraint(equalTo: sendButton.widthAnchor)
        ])
    }
}
