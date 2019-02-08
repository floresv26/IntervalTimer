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
    
    var timedIntervals: [TimedInterval] = []
    let cellId = "DataEntryViewCell"
    
    let screenSize = UIScreen.main.bounds.size
    var createActivityView: CreateActivityView!
    var dataEntryTableView: UITableView!
    
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
        
        print(createActivityView.frame)
        print(createActivityView.activityNameTextField.frame)
        print(createActivityView.addButton.frame)
    }
    
    // MARK: - Realm
    
    
    // MARK: - Create Activity
    
    func initializeCreateActivityView() {
        createActivityView = CreateActivityView()
        createActivityView.delegate = self
        createActivityView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: 50.0)
        createActivityView.translatesAutoresizingMaskIntoConstraints = false
        createActivityView.activityNameTextField.delegate = self
    }
    
    
    // CancelButton

    func enableCancelButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
    }
    
    @objc func cancelButtonPressed() {
        navigationItem.rightBarButtonItem = nil
        displayCreateActivityView()
        dataEntryTableView.isHidden = true
        dataEntryTableView = nil
        timedIntervals = []
    }
    
    func displayCreateActivityView() {
        createActivityView.activityNameLabel.isHidden = true
        createActivityView.activityNameLabel.text = nil
        createActivityView.activityNameTextField.isHidden = false
        createActivityView.addButton.isHidden = false
    }

    
    // Mark: DataEntryTableView
    
    func initializeDataEntryTableView() {
        dataEntryTableView = UITableView()
        dataEntryTableView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: 0)
        dataEntryTableView.register(DataEntryTableViewCell.self, forCellReuseIdentifier: cellId)
        dataEntryTableView.translatesAutoresizingMaskIntoConstraints = false
        
        dataEntryTableView.delegate = self
        dataEntryTableView.dataSource = self
        
        dataEntryTableView.rowHeight = 118
        
        addFooterToTableView()
    }
    
    func displayDataEntryTableView() {
        initializeDataEntryTableView()
        self.view.addSubview(dataEntryTableView)
        dataEntryTableView.backgroundColor = UIColor.purple
        dataEntryTableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        dataEntryTableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        dataEntryTableView.topAnchor.constraint(equalTo: createActivityView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        dataEntryTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func addFooterToTableView() {
        let footerView = FooterView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: screenSize.width,
                                                  height: 50))
        footerView.backgroundColor = UIColor.orange
        dataEntryTableView.tableFooterView = footerView
    }
    
    func addIntervalToTimedIntervals() {
        let timedInterval = TimedInterval()
        timedIntervals.append(timedInterval)
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
            
            createActivityView.activityNameLabel.text = validatedText
        }
        
        
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == createActivityView.activityNameTextField {
            textField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == createActivityView.activityNameTextField {
            createActivityView.displayActivityNameLabel(with: textField.text!)
            
            enableCancelButton()
            createActivityView.resetCreateActivityUI()
            displayDataEntryTableView()
            addIntervalToTimedIntervals()
        }
        
        return true
    }

}

// Mark: UITableViewDelegate, UITableViewDataSource

extension QuickLogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timedIntervals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DataEntryTableViewCell
        print("Row:  \(indexPath.row)")
        print(timedIntervals[indexPath.row])
        let interval = timedIntervals[indexPath.row]
        
        return cell
    }
    
    
}

