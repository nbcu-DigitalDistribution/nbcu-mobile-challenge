//
//  nbcu_mobile_challengeTests.swift
//  nbcu-mobile-challengeTests
//
//  Created by Honglin Yi on 9/11/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import XCTest
@testable import nbcu_mobile_challenge

class SurveyCollectorTests: XCTestCase {
    var surveyCollector: SurveyCollector!
    
    override func setUp() {
        super.setUp()
        surveyCollector = SurveyCollector()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSurveyModel() {
        surveyCollector.modifyResult(At: 0, result: "Yes", resultType: .String)
        XCTAssert(surveyCollector.answers.count == 1, "Adding new result fails")
        
        surveyCollector.modifyResult(At: 1, result: "No", resultType: .String)
        XCTAssert(surveyCollector.answers.count == 2, "Adding new result fails")
        
        surveyCollector.modifyResult(At: 0, result: "Other", resultType: .String)
        XCTAssert(surveyCollector.answers[0].result == "Other", "Changing new result fails")
        
        surveyCollector.modifyResult(At: 1, result: "Others", resultType: .String)
        XCTAssert(surveyCollector.answers[1].result == "Others", "Changing new result fails")
    }
   
}
