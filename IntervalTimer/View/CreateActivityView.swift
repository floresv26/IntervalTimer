//
//  CreateActivityView.swift
//  IntervalTimer
//
//  Created by Vanessa Flores on 2/6/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit

class CreateActivityView: UIView {
    
    weak var delegate: QuickLogViewController?
    
//  let screenSize = UIScreen.main.bounds.size

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setImage(UIImage(named: "add_dark.png"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 24.0, height: 24.0)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var activityNameTextField: DataEntryTextField = {
        let textField = DataEntryTextField()
        textField.frame = CGRect(x: 0, y: 0, width: 250.0, height: 30.0)
        textField.placeholder = "Add an activity"
        textField.font = UIFont(name: "Avenir", size: 17)
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var activityNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 0, height: 30.0)
        label.font = UIFont(name: "Avenir", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        
        return label
    }()
    
    func setupView() {
        backgroundColor = UIColor.lightGray
        addSubview(addButton)
        addButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0).isActive = true
        addButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 24.0).isActive = true
        
        addSubview(activityNameTextField)
        activityNameTextField.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        activityNameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10.0).isActive = true
        activityNameTextField.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10.0).isActive = true
        activityNameTextField.rightAnchor.constraint(equalTo: addButton.safeAreaLayoutGuide.leftAnchor, constant: -20.0).isActive = true
        
        addSubview(activityNameLabel)
        activityNameLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        activityNameLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0).isActive = true
        activityNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10.0).isActive = true
        activityNameLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10.0).isActive = true
        
    }
    
    @objc func addButtonTapped() {
        guard let validatedText = activityNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !validatedText.isEmpty else {
            return
        }
        
        displayActivityNameLabel(with: validatedText)
        delegate?.enableCancelButton()
        resetCreateActivityUI()
        delegate?.displayDataEntryTableView()
        delegate?.addIntervalToTimedIntervals()
    }
    
    func displayActivityNameLabel(with text: String) {
        activityNameLabel.text = text
        activityNameLabel.isHidden = false
        activityNameTextField.isHidden = true
        addButton.isHidden = true
        
        print(activityNameLabel.text)
    }
    
    func resetCreateActivityUI() {
        activityNameTextField.text = nil
        addButton.isEnabled = false
    }

}
