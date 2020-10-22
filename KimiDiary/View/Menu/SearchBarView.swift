//
//  SearchBarView.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 14/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class SearchBarView: UIButton {
    
    let buttonItem: UIButton = {
        let buttonItem = UIButton()
        buttonItem.setImage(MenuToolbarImages.lupe, for: .normal)
        buttonItem.translatesAutoresizingMaskIntoConstraints = false
        return buttonItem
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(buttonItem)
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            buttonItem.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            buttonItem.topAnchor.constraint(equalTo: self.topAnchor),
            buttonItem.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

