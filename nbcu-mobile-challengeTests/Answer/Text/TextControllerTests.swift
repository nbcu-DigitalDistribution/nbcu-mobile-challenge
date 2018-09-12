//
//  TextControllerTests.swift
//  nbcu-mobile-challengeTests
//
//  Created by Honglin Yi on 9/11/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import XCTest
@testable import nbcu_mobile_challenge

class TextControllerTests: XCTestCase {
    var controller: TextController!
    
    override func setUp() {
        super.setUp()
        controller = TextController()
        let model = AnswerModel(question: "How many hours do you watch videos in a week on Netflix/Amazon/Hulu/Etc?", isNumber: true, unit: "Hours", resultType: .Number)
        controller.setData(model)
        controller.viewDidLoad()
        controller.viewDidAppear(true)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLayout() {
        XCTAssert(controller.exposeTableView().numberOfRows(inSection: 0) == 1, "No rows in tableview")
    }
    
}
