//
//  DataEntryTableViewCell.swift
//  IntervalTimer
//
//  Created by Vanessa Flores on 2/7/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit

class DataEntryTableViewCell: UITableViewCell {
    
    let timedInterval = TimedInterval()
    
    lazy var completedButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: 0, y: 0, width: 24.0, height: 24.0)
        button.setImage(UIImage(named: "incomplete_checkmark.png"), for: .normal)
        button.tintColor = UIColor.lightGray
        button.addTarget(self, action: #selector(checkmarkTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    lazy var intervalTitleTextField: DataEntryTextField = {
        let textField = DataEntryTextField()
        textField.backgroundColor = UIColor.white
        textField.frame = CGRect(x: 0, y: 0, width: 250, height: 40)
        textField.placeholder = "Interval Title"
        textField.font = UIFont(name: "Avenir", size: 17)
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.next
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func checkmarkTapped() {
        if timedInterval.completed == false {
            completedButton.tintColor = UIColor.green
            timedInterval.completed = true
            print(timedInterval.completed)
        } else {
            completedButton.tintColor = UIColor.lightGray
            timedInterval.completed = false
            print(timedInterval.completed)
        }
    }
    
    func setupView() {
        contentView.addSubview(completedButton)
        completedButton.rightAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.rightAnchor, constant: -16.0).isActive = true
        completedButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        completedButton.widthAnchor.constraint(equalToConstant: 24.0).isActive = true
        completedButton.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        
        contentView.addSubview(intervalTitleTextField)
        intervalTitleTextField.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        intervalTitleTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16.0).isActive = true
        intervalTitleTextField.widthAnchor.constraint(equalToConstant: 250.0).isActive = true
        intervalTitleTextField.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
    }

}
