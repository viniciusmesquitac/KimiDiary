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
    
    fileprivate var titleEntry: UILabel = {
        let label = UILabel()
        label.text = "Beautiful Day"
        label.textColor = .blueTheme
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    fileprivate var descriptionEntry: UILabel = {
        let label = UILabel()
        label.text = "Short Description that maybe end"
        label.textColor = .blueTheme
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    lazy var containerView: UIView = {
//        let view = UIView()
//        view.layer.borderColor = UIColor.black.cgColor
//        view.layer.borderWidth = 1
//        view.layer.cornerRadius = 8
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//
//    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        
        contentView.backgroundColor = .white
        backgroundColor = .clear
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        

        contentView.layer.cornerRadius = 8
        self.selectionStyle = .none
        // self.contentView.addSubview(containerView)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(daily: Daily) {
        self.titleEntry.text = daily.title
        self.descriptionEntry.text = daily.bodyText
    }
    
    func buildViewHierarchy() {
        contentView.addSubview(dayLabel)
        contentView.addSubview(dayWeekLabel)
        contentView.addSubview(hourLabel)
        contentView.addSubview(titleEntry)
        contentView.addSubview(descriptionEntry)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            dayLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor)

        ])

        NSLayoutConstraint.activate([
            dayWeekLabel.centerXAnchor.constraint(equalTo: self.dayLabel.centerXAnchor),
            dayWeekLabel.topAnchor.constraint(equalTo: self.dayLabel.bottomAnchor),
            dayWeekLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 8)

        ])

        NSLayoutConstraint.activate([
            hourLabel.leadingAnchor.constraint(equalTo: self.dayLabel.trailingAnchor, constant: 8),
            hourLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8)

        ])

        NSLayoutConstraint.activate([
            titleEntry.leadingAnchor.constraint(equalTo: self.dayLabel.trailingAnchor, constant: 8),
            titleEntry.topAnchor.constraint(equalTo: self.hourLabel.bottomAnchor),

        ])

        NSLayoutConstraint.activate([
            descriptionEntry.leadingAnchor.constraint(equalTo: self.titleEntry.leadingAnchor),
            descriptionEntry.topAnchor.constraint(equalTo: self.titleEntry.bottomAnchor),
            descriptionEntry.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 8)

        ])
        
        
        
    }
    
}
