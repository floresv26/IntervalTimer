//
//  DataEntryCollectionViewCell.swift
//  IntervalTimer
//
//  Created by Vanessa Flores on 1/28/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit

class DataEntryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var intervalTitleTextField: UITextField!
    @IBOutlet weak var hourTextField: UITextField!
    @IBOutlet weak var minuteTextFIeld: UITextField!
    @IBOutlet weak var secondsTextField: UITextField!
    @IBOutlet weak var completedButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func completedButtonPressed(_ sender: UIButton) {
    }
}
