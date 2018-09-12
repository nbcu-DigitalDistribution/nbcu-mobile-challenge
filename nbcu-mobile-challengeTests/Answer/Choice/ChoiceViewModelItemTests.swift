//
//  ChoiceViewModelItemTests.swift
//  nbcu-mobile-challengeTests
//
//  Created by Honglin Yi on 9/11/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import XCTest
@testable import nbcu_mobile_challenge

class ChoiceViewModelItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNoSubtitles() {
       let model = ChoiceViewModelItem(title: "Yes", subTitles: [])
        XCTAssert(model.isCollapsible == false, "guard subTitles.count > 0 not work")
    }
    func testIsCollapsed() {
        let model = ChoiceViewModelItem(title: "No", subTitles: ["US", "Russia"])
        model.isCollapsed = !model.isCollapsed
        XCTAssert(model.rowCount > 1, "unfolding failed")
    }
    
}
