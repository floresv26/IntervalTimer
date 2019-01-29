//
//  ActivityTests.swift
//  IntervalTimerTests
//
//  Created by Vanessa Flores on 1/16/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import IntervalTimer

class ActivityTests: XCTestCase {
    
    var sut: Activity!

    override func setUp() {
        sut = Activity()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Activity_CanBeInitialized() {
        let timedInterval = TimedInterval(title: "Jab", hour: 0, minute: 1, second: 0)
        let timedIntervalsArray = [timedInterval]
        let activity = Activity(name: "Cobra Bag", timedIntervals: timedIntervalsArray)
        
        XCTAssertEqual(activity.name, "Cobra Bag")
        XCTAssertEqual(timedIntervalsArray[0].title, "Jab")
        XCTAssertEqual(timedIntervalsArray[0].hour, 0)
        XCTAssertEqual(timedIntervalsArray[0].minute, 1)
        XCTAssertEqual(timedIntervalsArray[0].second, 0)
    }
   

}
