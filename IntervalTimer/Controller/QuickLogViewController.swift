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
    
    var realm: Realm!
    var activity: Activity!

    @IBOutlet weak var activityNameLabel: UILabel!
    @IBOutlet weak var createActivityStackView: UIStackView!
    @IBOutlet weak var addActivityTextField: UITextField!
    @IBOutlet weak var addActivityButton: UIButton!
    
    var scrollView: QuickLogScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupRealm()
        addActivityTextField.delegate = self
        
//        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    // MARK: - Realm
    
    func setupRealm() {
        do {
            realm = try Realm()
        } catch let error as NSError {
            print("Error initializing new realm, \(error)")
        }
    }
    
    //    func addActivityToRealm(activity: Activity) {
    //        do {
    //            try realm.write {
    //                realm.add(activity)
    //            }
    //        } catch {
    //            print("Error writing data to realm, \(error)")
    //        }
    //    }
    
    
    
    
    //    func addTimedIntervalTitleToRealm(title: String) {
    //        do{
    //            try realm.write {
    //                realm.add(<#T##object: Object##Object#>)
    //            }
    //        }
    //    }
    //
    
    
    // MARK: - Data Entry
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        setActivityNameLabelText(from: addActivityTextField)
        resetCreateActivityStackView()
        hideCreateActivityStackView()
        displayScrollView()
    }
    
    func setActivityNameLabelText(from textField: UITextField) {
        guard let validatedText = textField.text else {
            return
        }
        
        activityNameLabel.text = validatedText.trimmingCharacters(in: .whitespacesAndNewlines)
        activityNameLabel.isHidden = false
        enableCancelButton()
    }
    
    func resetCreateActivityStackView() {
        addActivityTextField.text = ""
        addActivityTextField.resignFirstResponder()
        addActivityButton.isEnabled = false
    }
    
    func initializeScrollView() {
        scrollView = QuickLogScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func displayScrollView() {
        initializeScrollView()
        view.addSubview(scrollView)
        scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: createActivityStackView.safeAreaLayoutGuide.bottomAnchor, constant: 8.0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        scrollView.startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 16.0).isActive = true
    }
    
    func enableCancelButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
    }
    
    @objc func cancelButtonPressed() {
        scrollView.isHidden = true
        activityNameLabel.isHidden = true
        showCreateActivityStackView()
        print("Cancel button tapped")
    }

    
    // MARK: Animations
    func hideCreateActivityStackView() {
        UIStackView.animate(withDuration: 0, animations: {
            self.createActivityStackView.alpha = 0
        }) {
            _ in self.createActivityStackView.isHidden = true
        }
    }
    
    func showCreateActivityStackView() {
        UIStackView.animate(withDuration: 0, animations: {
            self.createActivityStackView.alpha = 1
        }) {
            _ in self.createActivityStackView.isHidden = false
        }
    }



}

// MARK: - UITextFieldDelegate

extension QuickLogViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == addActivityTextField {
            addActivityButton.isEnabled = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (addActivityTextField.text?.isEmpty)! {
            addActivityButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == addActivityTextField {
            setActivityNameLabelText(from: addActivityTextField)
            resetCreateActivityStackView()
            hideCreateActivityStackView()
            displayScrollView()
        }
        return true
    }

}

