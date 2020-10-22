//
//  EntriesToolbarView.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 15/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class EntriesToolbarView: UIView {
    
    lazy var menuItem: UIButton = {
        let button = UIButton()
        button.setImage(MenuToolbarImages.menu, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var menuItem1: UIButton = {
        let button = UIButton()
        button.setImage(MenuToolbarImages.pencil, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    lazy var menuItem2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "gear"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var labelEntries: UILabel = {
        let label = UILabel()
        label.text = "11 Entries"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(menuItem)
        addSubview(menuItem1)
        // addSubview(menuItem2)
        addSubview(labelEntries)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            menuItem.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            menuItem.topAnchor.constraint(equalTo: self.topAnchor),
            menuItem.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
        
            menuItem1.leadingAnchor.constraint(equalTo: self.menuItem.trailingAnchor, constant: 16),
            menuItem1.topAnchor.constraint(equalTo: self.topAnchor),
            menuItem1.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
//        NSLayoutConstraint.activate([
//
//            menuItem2.leadingAnchor.constraint(equalTo: self.menuItem1.trailingAnchor, constant: 16),
//            menuItem2.topAnchor.constraint(equalTo: self.topAnchor),
//            menuItem2.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
        
        NSLayoutConstraint.activate([
        
            labelEntries.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            labelEntries.topAnchor.constraint(equalTo: self.topAnchor),
            labelEntries.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
    
    
    
}
