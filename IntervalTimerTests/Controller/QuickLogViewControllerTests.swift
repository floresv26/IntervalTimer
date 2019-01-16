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

    

}
