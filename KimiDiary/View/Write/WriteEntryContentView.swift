//
//  WriteEntryContentView.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 22/10/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class WriteEntryContentView: UIView {

   
    var navigationBar: UINavigationBar = {
        let nav = UINavigationBar()
        nav.backgroundColor = .white
        nav.translatesAutoresizingMaskIntoConstraints = false
        return nav
    }()
    
    let writeTitleTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "Type a Title"
        textField.borderStyle = .line
        textField.font = UIFont.boldSystemFont(ofSize: 32)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let writeDescriptionTextField: UITextView = {
        let textField = UITextView()
        textField.backgroundColor = .white
        textField.font = UIFont.boldSystemFont(ofSize: 24)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        backgroundColor = .blue
        buildViewHierarchy()
        setupConstrants()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selectorX() { }
    
    private func buildViewHierarchy() {
        addSubview(navigationBar)
        addSubview(writeTitleTextField)
        addSubview(writeDescriptionTextField)
    }
    
    private func setupConstrants() {
        
        NSLayoutConstraint.activate([
            self.navigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.navigationBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            self.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            self.writeTitleTextField.topAnchor.constraint(equalTo: topAnchor, constant: 44),
            self.writeTitleTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.writeTitleTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.writeTitleTextField.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            self.writeDescriptionTextField.topAnchor.constraint(equalTo: writeTitleTextField.bottomAnchor),
            self.writeDescriptionTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.writeDescriptionTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.writeDescriptionTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }

}
