//
//  WriteEntryContentView.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 22/10/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

class WriteEntryContentView: UIView {

    let writeTitleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let writeDescriptionTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

}
