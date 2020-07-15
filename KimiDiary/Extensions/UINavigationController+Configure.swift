//
//  UINavigationController+Configure.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 14/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//


import UIKit

extension UINavigationController {
    
    func configure(title: String, largeTitle: Bool = true, tintColor: UIColor = .black) {
        
        navigationBar.barStyle  = .black
        
        navigationBar.prefersLargeTitles = largeTitle
        
        navigationBar.tintColor = tintColor
        
        navigationItem.title = title
        
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        

        // Change title color
        navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
    }
    
}
