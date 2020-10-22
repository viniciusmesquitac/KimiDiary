//
//  MenuTableViewController.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 14/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit


enum Items: String, CaseIterable {
    case emergency = "Emergency"
    case diary = "DIARY"
    case prohibited = "Prohibited Matter"
}

enum MenuTableImages {
    static let emergency = UIImage(named: "emergency")
    static let diary = UIImage(named: "diary")
    static let prohibited = UIImage(named: "prohibited")
}

class MenuTableViewController: UITableViewController {
    
//    var presentTransition: UIViewControllerAnimatedTransitioning?
//    var dismissTransition: UIViewControllerAnimatedTransitioning?
    let items = ["Emergency", "@User2323", "DIARY", "Prohibited Matter"]
    
    override func viewDidLoad() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.rowHeight = 80
        self.tableView.separatorColor = .blueTheme
        self.tableView.backgroundView = nil
        self.tableView.scrollsToTop = false
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.backgroundColor = .blueTheme
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Items.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = Items.allCases[indexPath.row].rawValue
        
        
        switch Items.allCases[indexPath.row] {
        case .emergency:
            cell.imageView?.image = MenuTableImages.emergency
        case .diary:
            cell.imageView?.image = MenuTableImages.diary
        case .prohibited:
            cell.imageView?.image = MenuTableImages.prohibited
        }
        cell.textLabel?.textColor = .blueTheme
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 149
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 400
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MenuHeaderView()
        header.backgroundColor = .none
        return header
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DiaryViewController()
        viewController.isModalInPresentation = false
        viewController.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

