//
//  QuickLogViewControllerTests.swift
//  IntervalTimerTests
//
//  Created by Vanessa Flores on 1/16/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import IntervalTimer

class QuickLogViewControllerTests: XCTestCase {
    
    var sut: QuickLogViewController!

    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "QuickLogViewController")
        sut = (viewController as! QuickLogViewController)
        
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_CreateActivityStackView_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.createActivityStackView)
    }
    
    func test_AddActivityTextField_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.addActivityTextField)
    }
    
    func test_AddActivityButton_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.addActivityButton)
    }
    
    func test_ActivityNameLabel_AfterViewDidLoad_IsHidden() {
        XCTAssertTrue(sut.activityNameLabel.isHidden)
    }
    
    func test_ActivityNameLabel_AfterAddActivityButtonPressed_IsSet() {
        sut.addActivityTextField.text = "Test Activity Name"
        sut.addActivityButton.sendActions(for: .touchUpInside)
        
        XCTAssertEqual(sut.activityNameLabel.text, "Test Activity Name")
    }
    
    func test_CreateActivityStackView_AfterAddButtonPressed_IsHidden() {
        sut.addActivityButton.sendActions(for: .touchUpInside)
        
        XCTAssertTrue(sut.createActivityStackView.isHidden)
    }
    
    func test_ActivityNameLabel_AfterAddButtonPressed_IsNotHidden() {
        sut.addActivityButton.sendActions(for: .touchUpInside)
        
        XCTAssertFalse(sut.activityNameLabel.isHidden)
    }
    
    func test_ScrollView_AfterAddButtonPressed_IsNotHidden() {
        sut.addActivityButton.sendActions(for: .touchUpInside)
        
        XCTAssertFalse(sut.scrollView.isHidden)
    }
    
    func test_CancelButton_AfterAddButtonPressed_IsNotNil() {
        sut.addActivityButton.sendActions(for: .touchUpInside)
        
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem)
    }
    
    func test_ScrollView_AfterCancelButtonPressed_IsRemovedFromView() {
        
    }
    
//    func test_ActivityName_WriteDataToRealm_IsNotNil() {
//        sut.setActivityName(name: "Cobra Bag")
//        sut.addActivityToRealm(activity: sut.activity)
//        
//        XCTAssertEqual(sut.realm.objects(Activity.self).count, 1)
//        
//    }

}
