//
//  FooterViewTests.swift
//  IntervalTimerTests
//
//  Created by Vanessa Flores on 2/8/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import IntervalTimer

class FooterViewTests: XCTestCase {
    
    var sut: FooterView!

    override func setUp() {
        sut = FooterView()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_AddIntervalButton_AfterViewInitialized_IsNotNil() {
        XCTAssertNotNil(sut.addIntervalButton)
    }
    
    func test_AddIntervalButton_AfterViewInitialized_IsDescendantOfView() {
        XCTAssertTrue(sut.addIntervalButton.isDescendant(of: sut))
    }

}
