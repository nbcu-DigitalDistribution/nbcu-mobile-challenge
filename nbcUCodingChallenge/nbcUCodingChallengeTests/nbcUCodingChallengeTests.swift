//
//  nbcUCodingChallengeTests.swift
//  nbcUCodingChallengeTests
//
//  Created by Chad Murdock on 9/13/18.
//  Copyright © 2018 KarmaDeli Works. All rights reserved.
//

import XCTest
@testable import nbcUCodingChallenge

class nbcUCodingChallengeTests: XCTestCase {
    
    func testINCValue(){
        let inc = "inc"
        XCTAssertEqual(inc, Utility.INC)
        
    }
    func testDECValue(){
        let dec = "dec"
        XCTAssertEqual(dec, Utility.DEC)
        
    }
    
    func testINCREMENTSValue(){
        let increments = "increments"
        XCTAssertEqual(increments, Utility.INCREMENTS)
        
    }
    func testDECREMENTSValue(){
        let decrements = "decrements"
        XCTAssertEqual(decrements, Utility.DECREMENTS)
        
    }
    func testDATA_PLANValue(){
        let dataPlan = "dataPlan"
        XCTAssertEqual(dataPlan, Utility.DATA_PLAN)
        
    }
    func testMAXValue(){
        let max = "max"
        XCTAssertEqual(max, Utility.MAX)
    }
    
    func testQUOValue(){
        let quo = "quo"
        XCTAssertEqual(quo, Utility.QUO)
        
    }
    
    func testPHONE_CHARGESValue(){
        let phoneCharges = "phoneCharges"
        XCTAssertEqual(phoneCharges, Utility.PHONE_CHARGES)
        
    }
    
    func testDATA_CHARGESValue(){
        let dataCharges = "dataCharges"
        XCTAssertEqual(dataCharges, Utility.DATA_CHARGES)
        
    }
    
    func testHOURLY_CHARGESValue(){
        let hourlyCharges = "hourlyCharges"
        XCTAssertEqual(hourlyCharges, Utility.HOURLY_CHARGES)
        
    }
    
    func testDATA_USAGEValue(){
        let dataUsage = "dataUsage"
        XCTAssertEqual(dataUsage, Utility.DATA_USAGE)
        
    }

    
    
}
