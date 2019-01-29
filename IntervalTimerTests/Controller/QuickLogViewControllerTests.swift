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
    
    func test_ActivityNameLabel_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.activityNameLabel)
    }
    
    func test_DataEntryCollectionView_AfterShowDataEntryCollectionView_IsNotNil() {
        XCTAssertNotNil(sut.dataEntryCollectionView)
    }
    
//    func test_ActivityName_WriteDataToRealm_IsNotNil() {
//        sut.setActivityName(name: "Cobra Bag")
//        sut.addActivityToRealm(activity: sut.activity)
//        
//        XCTAssertEqual(sut.realm.objects(Activity.self).count, 1)
//        
//    }

}
