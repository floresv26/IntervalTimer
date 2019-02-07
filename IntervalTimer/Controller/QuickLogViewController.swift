//
//  QuickLogViewController.swift
//  IntervalTimer
//
//  Created by Vanessa Flores on 1/16/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit
import RealmSwift

class QuickLogViewController: UIViewController {
    
    let screenSize = UIScreen.main.bounds.size
    var createActivityView: CreateActivityView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Quick Log"
        setupView()
        
//        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    func setupView() {
        initializeCreateActivityView()
        self.view.addSubview(createActivityView)
        createActivityView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        createActivityView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        createActivityView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        createActivityView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
    
    // MARK: - Realm
    
    
    // MARK: - Create Activity
    
    func initializeCreateActivityView() {
        createActivityView = CreateActivityView()
        createActivityView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: 50.0)
        createActivityView.translatesAutoresizingMaskIntoConstraints = false
        createActivityView.activityNameTextField.delegate = self
    }
    
    func setupActivityNameLabel(with text: String) {
        
    }
    
    
    // CancelButton

    func enableCancelButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
    }

    func removeCancelButton() {
        navigationItem.rightBarButtonItem = nil
    }
    
    @objc func cancelButtonPressed() {
        
    }
    
    
    // TimerControlView
    
    
    // MARK: Animations
    


}

// MARK: - UITextFieldDelegate

extension QuickLogViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if textField == createActivityView.activityNameTextField {
            if !text.isEmpty {
                createActivityView.addButton.isEnabled = true
            } else {
                createActivityView.addButton.isEnabled = false
            }
        }
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == createActivityView.activityNameTextField {
            guard let validatedText = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !validatedText.isEmpty else {
                return false
            }
            
            setupActivityNameLabel(with: validatedText)
            
        }
        
        return true
    }

}

