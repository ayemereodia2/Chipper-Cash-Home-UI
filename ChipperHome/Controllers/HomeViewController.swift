//
//  HomeViewController.swift
//  ChipperHome
//
//  Created by Ayemere  Odia  on 2022/10/19.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableHeaderView = UIView()
        return tableView
    }()
    
    private let leftButtonView: BarBButtonView = {
        let leftButtonView = BarBButtonView(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        leftButtonView.setLabel(text: "Help")
        leftButtonView.setButton(image: UIImage(systemName: "questionmark.circle"))
        leftButtonView.setLabel(color: UIColor.systemBlue)
        return leftButtonView
    }()
    
    private let rightButtonView: BarBButtonView = {
        let rightButtonView = BarBButtonView(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        rightButtonView.setLabel(text: "Profile")
        rightButtonView.setButton(image: UIImage(systemName: "person"))
        rightButtonView.setLabel(color: UIColor.systemBlue)
        return rightButtonView
    }()
    
    
    private let middleButtonView: BarBButtonView = {
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
        configureTopNavigationBar()
        registerCustomCell()
        setupLayout()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureTopNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButtonView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButtonView)
        navigationItem.titleView = middleButtonView
    }
    
    private func registerCustomCell() {
        tableView.register(TopOptionsViewCell.self, forCellReuseIdentifier: TopOptionsViewCell.cellId)
        tableView.register(TransactionViewCell.self, forCellReuseIdentifier: TransactionViewCell.cellId)
    }
}

extension HomeViewController {
    @objc func gotoHelp(action: UIAction) {
        
    }
    
    @objc func gotoProfile(action: UIAction) {
        
    }
}

extension HomeViewController {
    private func setupLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: TopOptionsViewCell.cellId) {
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: TransactionViewCell.cellId) {
                return cell
            }
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        }
        
        return UITableView.automaticDimension
    }
}
