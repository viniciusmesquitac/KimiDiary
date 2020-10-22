//
//  MenuDiaryViewController.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 14/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class MenuDiaryViewController: UIViewController {
    
    let tableView = MenuTableViewController(style: .grouped)
    let toolbar = MenuToolbarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blueTheme
        self.navigationController?.navigationBar.isHidden = true
        buildViewHierarchy()
        setupConstraints()
    }
    
    func buildViewHierarchy() {
        add(tableView)
        add(toolbar)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupConstraints() {
        
        
        NSLayoutConstraint.activate([
            toolbar.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            toolbar.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            toolbar.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            toolbar.view.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        
        NSLayoutConstraint.activate([
            tableView.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.view.bottomAnchor.constraint(equalTo: toolbar.view.topAnchor),
            tableView.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            
        ])
        
    }
    
}

