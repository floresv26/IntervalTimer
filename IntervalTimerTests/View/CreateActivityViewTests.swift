//
//  CreateActivityViewTests.swift
//  IntervalTimerTests
//
//  Created by Vanessa Flores on 2/6/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import IntervalTimer

class CreateActivityViewTests: XCTestCase {
    
    var sut: CreateActivityView!

    override func setUp() {
        sut = CreateActivityView()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_AddButton_WhenViewInitialized_IsNotNil() {
        XCTAssertNotNil(sut.addButton)
    }
    
    func test_ActivityNameTextField_WhenViewInitialized_IsNotNil() {
        XCTAssertNotNil(sut.activityNameTextField)
    }
    
    func test_ActivityNameLabel_WhenViewInitialized_IsNotNil() {
        XCTAssertNotNil(sut.activityNameLabel)
    }
    
    func test_AddButton_WhenViewInitialized_IsIsDescendantOfView() {
        XCTAssertTrue(sut.addButton.isDescendant(of: sut))
    }
    
    func test_ActivityNameTextField_WhenViewInitialized_IsIsDescendantOfView() {
        XCTAssertTrue(sut.activityNameTextField.isDescendant(of: sut))
    }
    
    func test_ActivityNameLabel_WhenViewInitialized_IsDescendantOfView() {
        XCTAssertTrue(sut.activityNameLabel.isDescendant(of: sut))
    }
    
    func test_ActivityNameTFAndAddButton_AddButtonTapped_AreHidden() {
        sut.activityNameTextField.text = "Test Activity Name"
        sut.addButton.sendActions(for: .touchUpInside)
        
        XCTAssertTrue(sut.activityNameTextField.isHidden)
        XCTAssertTrue(sut.addButton.isHidden)
    }
    
    func test_ActivityNameLabelText_AddButtonTapped_IsHiddenFalse() {
        sut.activityNameTextField.text = "Test Activity Name"
        sut.addButton.sendActions(for: .touchUpInside)
        
        XCTAssertFalse(sut.activityNameLabel.isHidden)
        XCTAssertEqual(sut.activityNameLabel.text, "Test Activity Name")
    }
    
}
