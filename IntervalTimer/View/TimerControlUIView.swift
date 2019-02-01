//
//  TimerControlUIView.swift
//  IntervalTimer
//
//  Created by Vanessa Flores on 1/31/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit

class TimerControlUIView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    lazy var startButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.roundedRect)
        button.backgroundColor = UIColor.gray
        button.tintColor = UIColor.white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        button.setTitle("START", for: .normal)
        button.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time"
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func setupView() {
        addSubview(startButton)
        startButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32.0).isActive = true
        startButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -32.0).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16.0).isActive = true
        //        startButton.isHidden = true
        
        addSubview(timeLabel)
        timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: startButton.safeAreaLayoutGuide.topAnchor, constant: -16.0).isActive = true
        //        timeLabel.isHidden = true
        
    }
    
    @objc func startButtonPressed() {
        print("Start button was pressed")
    }

}
