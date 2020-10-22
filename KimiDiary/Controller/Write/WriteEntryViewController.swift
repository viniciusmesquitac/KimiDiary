//
//  WriteEntryViewController.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 22/10/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

protocol WriteEntryDelegate: class {
    func didUpdateTableView()
}

class WriteEntryViewController: UIViewController {

    let contentView = WriteEntryContentView()
    let coreService = CoreService<Daily>(descriptionName: "Diary")
    
    var bossReference: DiaryViewController?
    var delegate: WriteEntryDelegate?
    
    override func viewDidLayoutSubviews() {
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: #selector(saveDaily))
        let navigationItem = UINavigationItem()
        navigationItem.rightBarButtonItem = doneBtn
        contentView.navigationBar.setItems([navigationItem], animated: false)
    }
    
    @objc func saveDaily() {
        
        let bodyText = contentView.writeDescriptionTextField.text
        let title = contentView.writeTitleTextField.text
        
        let daily = coreService.new()
        daily.bodyText = bodyText
        daily.title = title
        coreService.save()
        
        delegate?.didUpdateTableView()
        
        self.dismiss(animated: true, completion: nil)
        
        print("Saved!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = contentView
        self.delegate = bossReference
        self.navigationController?.navigationBar.tintColor = .blue
    }

}
