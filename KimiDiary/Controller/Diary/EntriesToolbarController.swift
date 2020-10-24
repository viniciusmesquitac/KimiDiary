//
//  EntriesToolbarController.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 15/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class EntriesToolbarController: UIViewController {

    var bossReference: DiaryViewController?
    
    lazy var toolbarView: EntriesToolbarView = {
        let toolbar = EntriesToolbarView()
        toolbar.backgroundColor = .blueTheme
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(toolbarView)
        
        toolbarView.menuItem.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        
        toolbarView.menuItem1.addTarget(self, action: #selector(writeButtonAction), for: .touchUpInside)
        
        setupConstraints()
    }
    
    @objc func menuButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func writeButtonAction() {
        let vc = WriteEntryViewController()
        vc.bossReference = bossReference
        self.navigationController?.present(vc, animated: true, completion: nil)
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

