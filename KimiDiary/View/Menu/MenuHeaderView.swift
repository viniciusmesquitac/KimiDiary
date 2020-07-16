//
//  MenuHeaderView.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 14/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class MenuHeaderView: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "apple")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var username: UILabel = {
        let textView = UILabel()
        textView.text = "Vinicius Mesquita"
        textView.textColor = .white
        textView.font = UIFont.boldSystemFont(ofSize: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(username)
        
        
        imageView.layer.masksToBounds = false
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 32
        imageView.clipsToBounds = true
        
        addSubview(imageView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        // Image user
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -21),
            imageView.widthAnchor.constraint(equalToConstant: 65)
        ])
        
        // Name user
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: self.imageView.topAnchor, constant: 5),
            username.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 16),
        ])
        
    }
}
