//
//  DiaryViewController.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 15/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController {
    
    let entriesToolbarController = EntriesToolbarController()
    let entriesTableViewController = EntriesTableViewController()
    let coreService = CoreService<Daily>(descriptionName: "Diary")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let entries = coreService.fetchAll()
        entriesTableViewController.entries = entries
        
        buildViewHierarchy()
        setupConstraints()
    }
    
    func buildViewHierarchy() {
        
        add(entriesTableViewController)
        
        entriesToolbarController.bossReference = self
        add(entriesToolbarController)
    }
    
   
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            entriesToolbarController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            entriesToolbarController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            entriesToolbarController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            entriesToolbarController.view.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            entriesTableViewController.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            entriesTableViewController.view.bottomAnchor.constraint(equalTo: self.entriesToolbarController.view.topAnchor),
            entriesTableViewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            entriesTableViewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
}


extension DiaryViewController: WriteEntryDelegate {
    func didUpdateTableView() {
        let entries = coreService.fetchAll()
        entriesTableViewController.entries = entries
    }
}
