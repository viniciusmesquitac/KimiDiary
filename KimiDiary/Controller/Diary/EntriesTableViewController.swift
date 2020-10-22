//
//  EntriesTableViewController.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 15/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class EntriesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.rowHeight = 95
        self.tableView.separatorStyle = .none
        self.tableView
            .register(EntriesDiaryTableViewCell.self, forCellReuseIdentifier: EntriesDiaryTableViewCell.identifier)
    }
    
    // MARK: Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: EntriesDiaryTableViewCell.identifier) as! EntriesDiaryTableViewCell
        return cell
    }
    
    // MARK: Size Configuration
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 115
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderTableViewDiary()
        return header
    }
    
    
    // MARK: Selection
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selection")
    }

    
}
