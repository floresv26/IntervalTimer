//
//  TimedIntervalTests.swift
//  IntervalTimerTests
//
//  Created by Vanessa Flores on 1/16/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import IntervalTimer

class TimedIntervalTests: XCTestCase {
    
    var sut: TimedInterval!

    override func setUp() {
        sut = TimedInterval()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_TimedIntervalObject_CanBeInitialized() {
        let timedInterval = TimedInterval(title: "Jab", hour: 0, minute: 1, second: 0)
        
        XCTAssertEqual(timedInterval.title, "Jab")
        XCTAssertEqual(timedInterval.hour, 0)
        XCTAssertEqual(timedInterval.minute, 1)
        XCTAssertEqual(timedInterval.second, 0)
    }
   

}
