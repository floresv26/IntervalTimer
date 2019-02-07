//
//  QuickLogScrollView.swift
//  IntervalTimer
//
//  Created by Vanessa Flores on 1/30/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit

class QuickLogScrollView: UIScrollView {
    
    var dataEntryTableView: DataEntryTableView!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }

    lazy var addIntervalButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.lightGray
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 30.0)
        button.setImage(UIImage(named: "circle_add.png"), for: .normal)
        button.setTitle("Add Interval", for: .normal)
        button.addTarget(self, action: #selector(addIntervalButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    // Mark: View Setup
    
    func setupView() {
        backgroundColor = UIColor.green
        addSubview(addIntervalButton)
        addIntervalButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        addIntervalButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16.0).isActive = true
        addIntervalButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        initializeDataEntryTableView()
        addSubview(dataEntryTableView)
        dataEntryTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        dataEntryTableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        dataEntryTableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        dataEntryTableView.bottomAnchor.constraint(equalTo: addIntervalButton.safeAreaLayoutGuide.topAnchor, constant: 8.0).isActive = true
    }
    
    
    // Mark: DataEntryTableView
    
    func initializeDataEntryTableView() {
        dataEntryTableView = DataEntryTableView()
    }
    
    // Mark: Adding an interval

    @objc func addIntervalButtonPressed() {
        
    }
    
    
    
    
}
