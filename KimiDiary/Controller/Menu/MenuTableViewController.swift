//
//  MenuTableViewController.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 14/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var presentTransition: UIViewControllerAnimatedTransitioning?
    var dismissTransition: UIViewControllerAnimatedTransitioning?
    
    let items = ["Emergency", "@User2323", "DIARY", "Prohibited Matter"]
    
    override func viewDidLoad() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.rowHeight = 80
//        self.tableView.isScrollEnabled = false
        self.tableView.separatorColor = .blueTheme
        self.tableView.backgroundView = nil
        self.tableView.scrollsToTop = false
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.backgroundColor = .blueTheme
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
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 149
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
        showSettings(controller: viewController, animated: false)
    }
}


extension MenuTableViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentTransition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissTransition
    }
}

extension MenuTableViewController {

    func showSettings(controller: UIViewController, animated: Bool) {

        presentTransition = RightToLeftTransition()
        dismissTransition = LeftToRightTransition()

        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = self

        present(controller, animated: true, completion: { [weak self] in
            self?.presentTransition = nil
        })
    }

}


//extension MenuTableViewController {
//
//    func presentDetail(_ viewControllerToPresent: UIViewController) {
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromRight
//        self.view.window!.layer.add(transition, forKey: kCATransition)
//
//        present(viewControllerToPresent, animated: false)
//    }
//
//    func dismissDetail() {
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromLeft
//        self.view.window!.layer.add(transition, forKey: kCATransition)
//
//        dismiss(animated: false)
//    }
//}
