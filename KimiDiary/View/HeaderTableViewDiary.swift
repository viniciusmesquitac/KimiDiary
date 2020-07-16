//
//  HeaderTableViewDiary.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 15/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class HeaderTableViewDiary: UIView {
    
    fileprivate let segmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Entries", "Calendar", "Diary"])
        segmented.selectedSegmentIndex = 0
        segmented.translatesAutoresizingMaskIntoConstraints = false
        return segmented
    }()
    
    fileprivate let titleHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Diary"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubview(titleHeader)
        addSubview(segmentedControl)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            segmentedControl.heightAnchor.constraint(equalToConstant: 28),
            segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            segmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            titleHeader.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor, constant: 8),
            titleHeader.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            titleHeader.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
    }
    
}
