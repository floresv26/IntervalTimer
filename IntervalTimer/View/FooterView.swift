//
//  FooterView.swift
//  IntervalTimer
//
//  Created by Vanessa Flores on 2/8/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit

class FooterView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    lazy var addIntervalButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.contactAdd)
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        button.setTitle("Add Interval", for: .normal)
        button.addTarget(self, action: #selector(addIntervalButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    func setupView() {
        addSubview(addIntervalButton)
        addIntervalButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        addIntervalButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        addIntervalButton.widthAnchor.constraint(equalToConstant: addIntervalButton.intrinsicContentSize.width).isActive = true
        addIntervalButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    @objc func addIntervalButtonTapped() {
        print("Add Interval Button Tapped")
        
    }
}
