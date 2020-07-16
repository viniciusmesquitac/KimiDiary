//
//  EntriesDiaryTableViewCell.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 15/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class EntriesDiaryTableViewCell: UITableViewCell {
    
    static let identifier = "cellId"
    
    fileprivate let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "09"
        label.textColor = .blueTheme
        label.font = UIFont.boldSystemFont(ofSize: 38)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    fileprivate let dayWeekLabel: UILabel = {
        let label = UILabel()
        label.text = "Fri"
        label.textColor = .blueTheme
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    fileprivate let hourLabel: UILabel = {
        let label = UILabel()
        label.text = "12:24"
        label.textColor = .blueTheme
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    fileprivate let titleEntry: UILabel = {
        let label = UILabel()
        label.text = "Beautiful Day"
        label.textColor = .blueTheme
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    fileprivate let descriptionEntry: UILabel = {
        let label = UILabel()
        label.text = "Short Description that maybe end"
        label.textColor = .blueTheme
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubview(dayLabel)
        addSubview(dayWeekLabel)
        addSubview(hourLabel)
        addSubview(titleEntry)
        addSubview(descriptionEntry)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            dayLabel.topAnchor.constraint(equalTo: self.topAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
            dayWeekLabel.centerXAnchor.constraint(equalTo: self.dayLabel.centerXAnchor),
            dayWeekLabel.topAnchor.constraint(equalTo: self.dayLabel.bottomAnchor),
            dayWeekLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            hourLabel.leadingAnchor.constraint(equalTo: self.dayLabel.trailingAnchor, constant: 8),
            hourLabel.topAnchor.constraint(equalTo: self.topAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            titleEntry.leadingAnchor.constraint(equalTo: self.dayLabel.trailingAnchor, constant: 8),
            titleEntry.topAnchor.constraint(equalTo: self.hourLabel.bottomAnchor),
            
        ])
        
        NSLayoutConstraint.activate([
            descriptionEntry.leadingAnchor.constraint(equalTo: self.dayLabel.trailingAnchor, constant: 8),
            descriptionEntry.topAnchor.constraint(equalTo: self.titleEntry.bottomAnchor),
            descriptionEntry.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
        
        
        
        
        
    }
    
}
