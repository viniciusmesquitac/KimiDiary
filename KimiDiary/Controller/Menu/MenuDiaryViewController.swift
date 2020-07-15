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
    
    lazy var toolbarView: ToolbarView = {
        let view = ToolbarView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blueTheme
        buildViewHierarchy()
        setupConstraints()
    }
    
    func buildViewHierarchy() {
        view.addSubview(toolbarView)
        add(tableView)
        add(toolbar)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            tableView.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            toolbarView.topAnchor.constraint(equalTo: tableView.view.bottomAnchor),
            toolbarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            toolbarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            toolbarView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
    }
    
}

