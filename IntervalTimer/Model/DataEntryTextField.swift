//
//  DataEntryTextField.swift
//  IntervalTimer
//
//  Created by Vanessa Flores on 1/19/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit

class DataEntryTextField: UITextField {
    
    override func draw(_ rect: CGRect) {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

}
