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

    func test_StartButton_AfterScrollViewInitilized_IsNotNil() {
        XCTAssertNotNil(sut.startButton)
    }

}
