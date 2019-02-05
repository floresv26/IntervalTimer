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
    var timerControlView: TimerControlUIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Quick Log"

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
    
    
    // MARK: - Create Activity
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        validateTextInput(from: addActivityTextField)
    }
    
    func validateTextInput(from textField: UITextField) {
        guard let validatedText = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !validatedText.isEmpty else {
            resetCreateActivityStackView()
            return
        }
        
        activityNameLabel.text = validatedText
        resetCreateActivityStackView()
        hideCreateActivityStackView()
        showActivityNameLabel()
        displayTimerControlView()
        displayScrollView()
        enableCancelButton()
    }
    
    // CreateActivityStackView
    
    func resetCreateActivityStackView() {
        addActivityTextField.text = nil
        addActivityButton.isEnabled = false
    }
    
    
    
    // ScrollView
    
    func displayScrollView() {
        initializeScrollView()
        
        view.addSubview(scrollView)
        scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: createActivityStackView.safeAreaLayoutGuide.bottomAnchor, constant: 8.0).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: scrollView.intrinsicContentSize.height).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: timerControlView.topAnchor).isActive = true
    }
    
    func initializeScrollView() {
        scrollView = QuickLogScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: scrollView.intrinsicContentSize.height)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: scrollView.intrinsicContentSize.height)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func removeScrollViewFromSuperView() {
        scrollView.removeFromSuperview()
        scrollView = nil
    }
    
    
    // CancelButton

    func enableCancelButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
    }

    func removeCancelButton() {
        navigationItem.rightBarButtonItem = nil
    }
    
    @objc func cancelButtonPressed() {
        removeScrollViewFromSuperView()
        hideActivityNameLabel()
        resetCreateActivityStackView()
        showCreateActivityStackView()
        removeCancelButton()
    }
    
    
    // TimerControlView
    
    func displayTimerControlView() {
        initializeTimerControlView()
        view.addSubview(timerControlView)
        timerControlView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 16.0).isActive = true
        timerControlView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        timerControlView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        
        print("TimerControlView frame: \(timerControlView.frame)")
        print("TimerLabel frame: \(timerControlView.timeLabel.frame)")
        print("StartButton frame: \(timerControlView.startButton.frame)")
    }
    
    func initializeTimerControlView() {
        timerControlView = TimerControlUIView()
        timerControlView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 124.0)
        timerControlView.translatesAutoresizingMaskIntoConstraints = false
    }

    
    // MARK: Animations
    func hideCreateActivityStackView() {
        UIStackView.animate(withDuration: 0.1,
                            delay: 0.0,
                            options: .curveEaseOut,
                            animations: {
                                self.createActivityStackView.alpha = 0
                                self.createActivityStackView.isHidden = true
        }, completion: {finished in

        })
    }

    func showCreateActivityStackView() {
        UIStackView.animate(withDuration: 0.1, animations: {
            self.createActivityStackView.alpha = 1
        }) {
            _ in self.createActivityStackView.isHidden = false
        }
    }

    func showActivityNameLabel() {
        UILabel.animate(withDuration: 0.1,
                            delay: 0,
                            options: .curveLinear,
                            animations: {
                                self.activityNameLabel.isHidden = false
                                self.activityNameLabel.alpha = 1.0
        }, completion: {finished in

        })
    }
    
    func hideActivityNameLabel() {
        UILabel.animate(withDuration: 0.1,
                            delay: 0.0,
                            options: .curveEaseOut,
                            animations: {
                                self.activityNameLabel.alpha = 0
                                self.activityNameLabel.isHidden = true
                                self.activityNameLabel.text = nil
        }, completion: {finished in
            
        })
    }



}

// MARK: - UITextFieldDelegate

extension QuickLogViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if textField == addActivityTextField {
            if !text.isEmpty {
                addActivityButton.isEnabled = true
            } else {
                addActivityButton.isEnabled = false
            }
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (addActivityTextField.text?.isEmpty)! {
            addActivityButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == addActivityTextField {
            textField.resignFirstResponder()
            validateTextInput(from: addActivityTextField)
        }
        return true
    }

}

