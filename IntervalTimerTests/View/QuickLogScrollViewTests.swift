//
//  QuickLogScrollViewTests.swift
//  IntervalTimerTests
//
//  Created by Vanessa Flores on 1/30/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import IntervalTimer

class QuickLogScrollViewTests: XCTestCase {
    
    var sut: QuickLogScrollView!

    override func setUp() {
        sut = QuickLogScrollView()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_StackView_AfterScrollViewDisplayed_IsNotNil() {
        XCTAssertNotNil(sut.stackView)
    }

    func test_StackView_IsDescendantOfScrollView() {
        XCTAssertTrue(sut.stackView.isDescendant(of: sut))
    }
    
    func test_DataEntryViews_AfterScrollViewDisplayed_IsNotNil() {
        XCTAssertNotNil(sut.dataEntryViews)
    }
    
    func test_DataEntryViews_AfterScrollViewDisplayed_HasCountOf1() {
        XCTAssertEqual(sut.dataEntryViews.count, 1)
    }
    
    func test_DataEntryView_AfterScrollViewDisplayed_IsDescendantOfStackView() {
        XCTAssertTrue(sut.dataEntryViews[0].isDescendant(of: sut.stackView))
    }
    
    func test_AddIntervalButton_AfterScrollViewDisplayed_IsNotNil() {
        XCTAssertNotNil(sut.addIntervalButton)
    }
    
    func test_AddIntervalButton_IsDescendantOfStackView() {
        XCTAssertTrue(sut.addIntervalButton.isDescendant(of: sut))
    }
    
    func test_AddIntervalButton_HasActions() {
        let actions = sut.addIntervalButton.actions(forTarget: sut, forControlEvent: .touchUpInside)
        XCTAssertEqual(actions?.count, 1)
    }
    
    func test_AddIntervalButtonPressed_IncreasesDataEntryViewsArray() {
        sut.addIntervalButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.dataEntryViews.count, 2)
    }
    
    func test_AddIntervalButtonPressed_IncreasesViewsDescendantsBy1() {
        sut.addIntervalButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.subviews.count, 2)
    }
}
