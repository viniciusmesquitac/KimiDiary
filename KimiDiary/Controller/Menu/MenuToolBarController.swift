//
//  MenuToolBarController.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 14/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class MenuToolbarController: UIViewController {
    
    lazy var toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.backgroundColor = .black
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()
    
    lazy var customSearch: UIView = {
        let view = ToolbarView()
        view.sizeToFit()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(toolbar)
        
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .search, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
        ]
        
        setupContraint()
    }
    
    func setupContraint() {
        
        NSLayoutConstraint.activate([
            toolbar.topAnchor.constraint(equalTo: self.view.topAnchor),
            toolbar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            toolbar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
    
}
