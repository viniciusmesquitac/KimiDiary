//
//  EntriesTableViewController.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 15/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class EntriesTableViewController: UITableViewController {
    
    
    let coreService = CoreService<Daily>(descriptionName: "Diary")
    
    var entries: [Daily]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.rowHeight = 95
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .white
        self.tableView
            .register(EntriesDiaryTableViewCell.self, forCellReuseIdentifier: EntriesDiaryTableViewCell.identifier)
    }
    
    // MARK: Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let entries = entries else { return 0 }
        return entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EntriesDiaryTableViewCell.identifier) as! EntriesDiaryTableViewCell
        
        guard let daily = entries?[indexPath.row] else { return cell }
        cell.configure(daily: daily)
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
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete"){ (_, _, success) in
            self.delete(forRowAt: indexPath)
            success(true)
        }
        let configure: UISwipeActionsConfiguration
        configure = UISwipeActionsConfiguration(actions: [delete])
        configure.performsFirstActionWithFullSwipe = false
        return configure
    }
    
    func delete(forRowAt indexPath: IndexPath) {
        guard var entries = entries else { return }
        tableView.beginUpdates()
        coreService.delete(object: entries[indexPath.row])
        entries.remove(at: indexPath.row)
        self.entries = entries
        tableView.deleteRows(at: [indexPath], with: .right)
        tableView.endUpdates()
    }
    
    
}
