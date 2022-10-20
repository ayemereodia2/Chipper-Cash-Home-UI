//
//  ViewController.swift
//  ChipperHome
//
//  Created by Ayemere  Odia  on 2022/10/19.
//

import UIKit

class ContainerViewController: UITabBarController {

    private let bottomView: ButtomView = {
    let view = ButtomView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomView)
        configureBottomViewLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBar.shadowImage = nil
        tabBar.clipsToBounds = true
        
        let item1 = UITabBarItem(title: "Home", image: UIImage(systemName: "face.smiling"), selectedImage: nil)
        let homeVC = HomeViewController()
        homeVC.tabBarItem = item1
        let navVC = UINavigationController(rootViewController: homeVC)
//        navVC.navigationBar.shadowImage = nil
//        navVC.navigationBar.clipsToBounds = true
//        navVC.navigationBar.barTintColor = .white
        
        let item2 = UITabBarItem(title: "Earn", image: UIImage(systemName: "trash"), selectedImage: nil)
        let earnVC = EarnViewController()
        earnVC.tabBarItem = item2
        
        let item3 = UITabBarItem(title: "Invest", image: UIImage(systemName: "dollarsign.circle"), selectedImage: nil)
        let investVC = EarnViewController()
        investVC.tabBarItem = item3
        
        let item4 = UITabBarItem(title: "Card", image: UIImage(systemName: "creditcard"), selectedImage: nil)
        let cardVC = EarnViewController()
        cardVC.tabBarItem = item4
        
        viewControllers = [navVC, earnVC, investVC, cardVC]
        
    }
}

extension ContainerViewController {
    func configureBottomViewLayout() {
        NSLayoutConstraint(item: bottomView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.60, constant: 0).isActive = true
        NSLayoutConstraint.activate([
            bottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}

