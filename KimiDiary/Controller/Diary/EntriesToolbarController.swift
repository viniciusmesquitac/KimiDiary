//
//  EntriesToolbarController.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 15/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class EntriesToolbarController: UIViewController {

    lazy var toolbarView: EntriesToolbarView = {
        let toolbar = EntriesToolbarView()
        toolbar.backgroundColor = .white
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(toolbarView)
        
        toolbarView.menuItem.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        
        setupConstraints()
    }
    
    @objc func menuButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            toolbarView.topAnchor.constraint(equalTo: self.view.topAnchor),
            toolbarView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            toolbarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            toolbarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

