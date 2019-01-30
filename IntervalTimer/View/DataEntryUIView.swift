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
        textField.backgroundColor = UIColor.orange
        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        textField.placeholder = "Interval Title"
        textField.font = UIFont(name: "Avenir", size: 17)
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.next
        print("intervalTextField initialized")
        
        return textField
    }()
    
    func setupView() {
        addSubview(intervalTitleTextField)
    }

}
