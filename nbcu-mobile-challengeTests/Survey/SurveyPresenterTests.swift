//
//  SurveyPresenterTests.swift
//  nbcu-mobile-challengeTests
//
//  Created by Honglin Yi on 9/11/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import XCTest
@testable import nbcu_mobile_challenge

class SurveyPresenterTests: XCTestCase {
    var presenter: SurveyPresenter!
    
    override func setUp() {
        super.setUp()
        presenter = SurveyPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMoveForwardWithoutFirstController() {
        presenter.moveForward()
        let (index, controllers, _ ) = presenter.exposeProperties()
        XCTAssert(index != 1, "No move")
        XCTAssert(controllers.count != 1, "No new controller")
    }
    
    func testMoveForward() {
        presenter.setInitViewState()
        presenter.moveForward()
        
        let (index , controllers, _ ) = presenter.exposeProperties()
        XCTAssert(index == 0, "No move with \(controllers.count) \(index)")
        XCTAssert(controllers.count > 0, "No new controller \(controllers.count)")
    }
    
}
