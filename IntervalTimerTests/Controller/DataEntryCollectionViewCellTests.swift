//
//  DataEntryCollectionViewCellTests.swift
//  IntervalTimerTests
//
//  Created by Vanessa Flores on 1/29/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import IntervalTimer

class DataEntryCollectionViewCellTests: XCTestCase {
    
    var sut: DataEntryCollectionViewCell!

    override func setUp() {
        let bundle = Bundle(for: DataEntryCollectionViewCell.self)
        guard let view = bundle.loadNibNamed("DataEntryCollectionViewCell", owner: nil)?.first as? UICollectionViewCell else {
            return print("DataEntryCollectionViewCell nib did not contain a UICollectionViewCell")
        }
        
        sut = (view as! DataEntryCollectionViewCell)
        
        sut.awakeFromNib()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_IntervalTitleTextField_IsNotNil() {
        XCTAssertNotNil(sut.intervalTitleTextField)
    }
    
    func test_HourTextField_IsNotNil() {
        XCTAssertNotNil(sut.hourTextField)
    }
    
    func test_MinuteTextField_IsNotNil() {
        XCTAssertNotNil(sut.minuteTextFIeld)
    }
    
    func test_SecondsTextField_IsNotNil() {
        XCTAssertNotNil(sut.secondsTextField)
    }
    
    func test_CompletedButton_IsNotNil() {
        XCTAssertNotNil(sut.completedButton)
    }

}
