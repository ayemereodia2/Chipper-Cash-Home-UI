//
//  HomeViewController.swift
//  ChipperHome
//
//  Created by Ayemere  Odia  on 2022/10/19.
//

import UIKit

class HomeViewController: UIViewController {
    
    let leftButtonView: BarBButtonView = {
        let leftButtonView = BarBButtonView(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        leftButtonView.setLabel(text: "Help")
        leftButtonView.setButton(image: UIImage(systemName: "questionmark.circle"))
        leftButtonView.setLabel(color: UIColor.systemBlue)
        return leftButtonView
    }()
    
    let rightButtonView: BarBButtonView = {
        let rightButtonView = BarBButtonView(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        rightButtonView.setLabel(text: "Profile")
        rightButtonView.setButton(image: UIImage(systemName: "person"))
        rightButtonView.setLabel(color: UIColor.systemBlue)
        return rightButtonView
    }()
    
    
    let middleButtonView: BarBButtonView = {
        let middleButtonView = BarBButtonView(frame: CGRect(x: 0, y: 0, width: 80, height: 60))
        middleButtonView.setLabel(text: "Wallet")
        middleButtonView.setLabel(font: UIFont.systemFont(ofSize: 17, weight: .semibold))
        middleButtonView.setButton(text: "N284.91")
        middleButtonView.setButton(font: UIFont.systemFont(ofSize: 17, weight: .semibold))
        middleButtonView.setImage(image: UIImage(systemName: "chevron.down"))
        middleButtonView.setImage(tintColor: UIColor.black)
        middleButtonView.setButton(tintColor: UIColor.black)
        middleButtonView.setLabel(color: UIColor.systemBlue)
        return middleButtonView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButtonView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButtonView)
        navigationItem.titleView = middleButtonView
        
    }
}

extension HomeViewController {
    @objc func gotoHelp(action: UIAction) {
        
    }
    
    @objc func gotoProfile(action: UIAction) {
        
    }
}

class BarBButtonView: UIView {
    private let button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let label: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private let arrowimage: UIImageView = {
        let view = UIImageView()
        return view
    }()
        
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 3
        return stackView
    }()
    
    private let hstackView: UIStackView = {
        let hstackView = UIStackView()
        hstackView.axis = .horizontal
        hstackView.distribution = .fill
        hstackView.spacing = 3
        return hstackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        hstackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)
        stackView.addArrangedSubview(hstackView)
        hstackView.addArrangedSubview(button)
        hstackView.addArrangedSubview(arrowimage)
        stackView.addArrangedSubview(label)
        
        setupView()
        setupLayout()
    }
    
    func setImage(image: UIImage?) {
        arrowimage.image = image
    }
    
    func setImage(tintColor: UIColor?) {
        arrowimage.tintColor = tintColor
    }
    
    func setLabel(text: String?) {
        label.text = text
    }
    
    func setLabel(color: UIColor?) {
        label.textColor = color
    }
    
    func setLabel(font: UIFont?) {
        label.font = font
    }
    
    func setButton(image: UIImage?){
        button.setImage(image, for: .normal)
    }
    
    func setButton(text: String?){
        button.setTitle(text, for: .normal)
    }
    
    func setButton(tintColor: UIColor?){
        button.tintColor = tintColor
        button.setTitleColor(tintColor, for: .normal)
    }
    
    func setButton(font: UIFont?){
        button.titleLabel?.font = font
    }
    
    private func setupView() {
       
    }
    func buttonTap(action: () -> Void?) {
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
