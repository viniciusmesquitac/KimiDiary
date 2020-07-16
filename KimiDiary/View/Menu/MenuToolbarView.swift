//
//  ToolbarView.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 14/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class MenuToolbarView: UIView {
    
    lazy var searchBar: SearchBarView = {
       let view = SearchBarView()
        view.backgroundColor = .blueTheme
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let buttonItem: UIButton = {
        let buttonItem = UIButton()
        buttonItem.setImage(UIImage(named: "gear"), for: .normal)
        buttonItem.translatesAutoresizingMaskIntoConstraints = false
        return buttonItem
    }()
    
    let line: UIView = {
        let view = UIView()
        view.backgroundColor = .blueTheme
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .blue
        addSubview(line)
        addSubview(searchBar)
        addSubview(buttonItem)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            buttonItem.leadingAnchor.constraint(equalTo: self.searchBar.trailingAnchor),
            buttonItem.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            buttonItem.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            buttonItem.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            line.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            line.topAnchor.constraint(equalTo: self.topAnchor),
            line.heightAnchor.constraint(equalToConstant: 0.5),
            line.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        
    }
}
