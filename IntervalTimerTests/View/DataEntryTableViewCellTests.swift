//
//  DataEntryTableViewCellTests.swift
//  IntervalTimerTests
//
//  Created by Vanessa Flores on 2/7/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import IntervalTimer

class DataEntryTableViewCellTests: XCTestCase {
    
    var sut: DataEntryTableViewCell!

    override func setUp() {
        sut = DataEntryTableViewCell()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_CompletedButton_AfterCellInitialized_IsNotNil() {
        XCTAssertNotNil(sut.completedButton)
    }
    
    func test_CompletedButton_AfterCellInitialized_IsDescendantOfCell() {
        XCTAssertTrue(sut.completedButton.isDescendant(of: sut.contentView))
    }
    
    func test_IntervalTitleTF_AfterCellInitialized_IsNotNil() {
        XCTAssertNotNil(sut.intervalTitleTextField)
    }
    
    func test_IntervalTitleTF_AfterCellIntialized_IsDescendantOfCell() {
        XCTAssertTrue(sut.intervalTitleTextField.isDescendant(of: sut.contentView))
    }
}
