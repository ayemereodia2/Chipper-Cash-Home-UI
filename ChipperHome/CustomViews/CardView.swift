//
//  CardView.swift
//  ChipperHome
//
//  Created by Ayemere  Odia  on 2022/10/21.
//

import UIKit

class CardView: UIView {
    
    private let largeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "padlock")!
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let smallImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lock")!
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let topMessageLabel: UILabel = {
        let topLabel = UILabel()
        topLabel.text = "Protect Your Account!"
        topLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        topLabel.numberOfLines = 0
        topLabel.lineBreakMode = .byWordWrapping
        topLabel.textColor = .white
        return topLabel
    }()
    
    private let bottomMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Never share your PIN, password, OTP with anyone. Do not click suspicous links in your email"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        return label
    }()
    
    private let learnMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("LEARN MORE>", for: .normal)
        button.setTitleColor(UIColor.hexStringToUIColor(hex: "42c0a1"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .top
        stackView.spacing = 16
        return stackView
    }()
    
    private let innerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()
    
    private let imageLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 1
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        innerStackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        learnMoreButton.translatesAutoresizingMaskIntoConstraints = false
        bottomMessageLabel.translatesAutoresizingMaskIntoConstraints = false

        topMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        smallImage.translatesAutoresizingMaskIntoConstraints = false
        largeImage.translatesAutoresizingMaskIntoConstraints = false

        
        addSubview(stackView)
        imageLabelStackView.addArrangedSubview(smallImage)
        imageLabelStackView.addArrangedSubview(topMessageLabel)
        
        innerStackView.addArrangedSubview(imageLabelStackView)
        innerStackView.addArrangedSubview(bottomMessageLabel)
        innerStackView.setCustomSpacing(35, after: bottomMessageLabel)
        innerStackView.addArrangedSubview(learnMoreButton)

        
        stackView.addArrangedSubview(largeImage)
        stackView.addArrangedSubview(innerStackView)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        bottomMessageLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        NSLayoutConstraint(item: largeImage, attribute: .topMargin, relatedBy: .equal, toItem: imageLabelStackView, attribute: .topMargin, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            largeImage.heightAnchor.constraint(equalToConstant: 75),
            largeImage.widthAnchor.constraint(equalToConstant: 75),
            
            smallImage.widthAnchor.constraint(equalToConstant: 20),
            smallImage.heightAnchor.constraint(equalTo: smallImage.widthAnchor),
        ])
        
        layer.cornerRadius = 12
        backgroundColor = UIColor.hexStringToUIColor(hex: "072A6C")
    }
}
