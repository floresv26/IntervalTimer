//
//  DataEntryUIView.swift
//  IntervalTimer
//
//  Created by Vanessa Flores on 1/30/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit

class DataEntryUIView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    lazy var intervalTitleTextField: DataEntryTextField = {
        let textField = DataEntryTextField()
        textField.backgroundColor = UIColor.white
        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        textField.placeholder = "Interval Title"
        textField.font = UIFont(name: "Avenir", size: 17)
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.next
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var timeTextFieldsView: TimeTextFieldsView = {
        let view = TimeTextFieldsView()
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 30)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var completedButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        button.setImage(UIImage(named: "incomplete_checkmark.png"), for: .normal)
        button.addTarget(self, action: #selector(completedButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    func setupView() {
        addSubview(intervalTitleTextField)
        intervalTitleTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        intervalTitleTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0).isActive = true
        intervalTitleTextField.widthAnchor.constraint(equalToConstant: 250.0).isActive = true
        intervalTitleTextField.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        addSubview(timeTextFieldsView)
        timeTextFieldsView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        timeTextFieldsView.topAnchor.constraint(equalTo: intervalTitleTextField.bottomAnchor, constant: 16.0).isActive = true
        timeTextFieldsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16.0).isActive = true
        timeTextFieldsView.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        addSubview(completedButton)
        completedButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        completedButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16.0).isActive = true
    }
        
    @objc func completedButtonPressed() {
        
    }
}

class TimeTextFieldsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    lazy var hourTextField: TimeTextField = {
        let textField = TimeTextField()
        textField.placeholder = "HH"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var minuteTextField: TimeTextField = {
        let textField = TimeTextField()
        textField.placeholder = "MM"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var secondsTextField: TimeTextField = {
        let textField = TimeTextField()
        textField.placeholder = "SS"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var firstColonLabel: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.font = UIFont(name: "Avenir", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var secondColonLabel: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.font = UIFont(name: "Avenir", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func setupView() {
        addSubview(hourTextField)
        hourTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        hourTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        hourTextField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        hourTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        hourTextField.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        addSubview(firstColonLabel)
        firstColonLabel.leftAnchor.constraint(equalTo: hourTextField.safeAreaLayoutGuide.rightAnchor, constant: 8.0).isActive = true
        firstColonLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true

        addSubview(minuteTextField)
        minuteTextField.leftAnchor.constraint(equalTo: firstColonLabel.rightAnchor, constant: 8.0).isActive = true
        minuteTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        minuteTextField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        minuteTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        minuteTextField.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        addSubview(secondColonLabel)
        secondColonLabel.leftAnchor.constraint(equalTo: minuteTextField.safeAreaLayoutGuide.rightAnchor, constant: 8.0).isActive = true
        secondColonLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        addSubview(secondsTextField)
        secondsTextField.leftAnchor.constraint(equalTo: secondColonLabel.rightAnchor, constant: 8.0).isActive = true
        secondsTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        secondsTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        secondsTextField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        secondsTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        secondsTextField.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
}

class TimeTextField: DataEntryTextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        textFieldSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        textFieldSetup()
    }
    
    private func textFieldSetup() {
        self.backgroundColor = UIColor.white
        frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        font = UIFont(name: "Avenir", size: 20)
        keyboardType = UIKeyboardType.numberPad
        returnKeyType = UIReturnKeyType.next
        contentVerticalAlignment = .center
        textAlignment = .center
    }
}
