//
//  MenuTableViewController.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 14/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    let items = ["Emergency", "@User2323", "DIARY", "Prohibited Matter"]
    
    override func viewDidLoad() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.rowHeight = 80
        self.tableView.isScrollEnabled = false
        self.tableView.separatorColor = .blueTheme
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = UIImage(named: "gear")
        cell.textLabel?.textColor = .blueTheme
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 149
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = MenuHeaderView()
        view.backgroundColor = .blueTheme
        return view
    }

    
}
