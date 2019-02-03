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
    
    func test_ActivityNameLabel_AfterReturnKeyPressed_IsSet() {
//        sut.addActivityTextField.text = "Activity Name"
        sut.addActivityTextField.sendActions(for: .touchUpInside)
        
        XCTAssertNil(sut.addActivityTextField.text)
        XCTAssertEqual(sut.activityNameLabel.text, "Activity Name")
        print(sut.activityNameLabel.text)
//        sut.displayScrollView()
//        XCTAssertNotNil(sut.scrollView)
//        XCTAssertTrue(sut.scrollView.isDescendant(of: sut.view))
    }
    
    func test_CreateActivityStackView_AfterReturnKeyPressed_IsHidden() {
        sut.addActivityTextField.sendActions(for: .touchUpInside)
//        sut.hideCreateActivityStackView()
        XCTAssertTrue(sut.createActivityStackView.isHidden)
    }
    
//    func test_ScrollView_AfterReturnKeyPressed_IsDisplayed() {
//        sut.addActivityTextField.sendActions(for: .touchUpInside)
//        XCTAssertTrue(sut.scrollView.isDescendant(of: sut.view))
//    }
    
    
    
//    func test_ActivityName_WriteDataToRealm_IsNotNil() {
//        sut.setActivityName(name: "Cobra Bag")
//        sut.addActivityToRealm(activity: sut.activity)
//        
//        XCTAssertEqual(sut.realm.objects(Activity.self).count, 1)
//        
//    }

}
