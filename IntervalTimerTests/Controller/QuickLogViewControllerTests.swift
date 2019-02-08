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
    
    func test_CreateActivityView_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.createActivityView)
    }
    
    func test_CreateActivityView_AfterViewDidLoad_IsDescendantOfView() {
        XCTAssertTrue(sut.createActivityView.isDescendant(of: sut.view))
    }
    
    func test_DataEntryTableView_AddButtonTapped_IsNotNil() {
        sut.createActivityView.activityNameTextField.text = "Test Activity Name"
        sut.createActivityView.addButton.sendActions(for: .touchUpInside)
       
        XCTAssertNotNil(sut.dataEntryTableView)
    }
    
    func test_DataEntryTableView_AddButtonTapped_IsDescendantOfSut() {
        sut.createActivityView.activityNameTextField.text = "Test Activity Name"
        sut.createActivityView.addButton.sendActions(for: .touchUpInside)
        
        XCTAssertTrue(sut.dataEntryTableView.isDescendant(of: sut.view))
    }
    
    func test_TimedInterval_AddButtonTapped_AddedToTimedIntervals() {
        sut.createActivityView.activityNameTextField.text = "Test"
        sut.createActivityView.addButton.sendActions(for: .touchUpInside)
        
        XCTAssertEqual(sut.timedIntervals.count, 1)
    }
    
    func test_DataEntryTableView_CancelButtonTapped_IsNil() {
        sut.createActivityView.activityNameTextField.text = "Test"
        sut.createActivityView.addButton.sendActions(for: .touchUpInside)
        guard let action = sut.navigationItem.rightBarButtonItem?.action else {
            return XCTFail("The Cancel button doesn't have an action")
        }
        sut.navigationItem.rightBarButtonItem?.target?.perform(action)
        XCTAssertNil(sut.dataEntryTableView)
    }
    
    func test_DataEntryTableView_Footer_IsNotNil() {
        sut.createActivityView.activityNameTextField.text = "Test"
        sut.createActivityView.addButton.sendActions(for: .touchUpInside)
        
        XCTAssertNotNil(sut.dataEntryTableView.tableFooterView)
    }
    
//    func test_DataEntryTableView_Footer_IsFooterView() {
//        XCTAssertNotNil(sut.dataEntryTableView.footerView(forSection: 0))
//    }
    

}
