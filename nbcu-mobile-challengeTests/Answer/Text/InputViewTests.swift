//
//  InputViewTests.swift
//  nbcu-mobile-challengeTests
//
//  Created by Honglin Yi on 9/11/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import XCTest
@testable import nbcu_mobile_challenge

class InputViewTests: XCTestCase {
    var textView: InputView!
    
    override func setUp() {
        super.setUp()
        textView = InputView(frame: CGRect(x: 0, y: 10, width: 375, height: 60))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUnit() {
        let width = textView.exposeUnitLabel().frame.width
        textView.changeUnit(unit: "Hours")
        let message = "ChangeUnit not work with width: \(textView.exposeUnitLabel().frame.width)"
        XCTAssert(abs(textView.exposeUnitLabel().frame.width - width) > 2, message)
    }
    
    func testKeyboad() {
        let type = textView.textField.keyboardType
        textView.changeKeyboard(isNumber: false)
        XCTAssert(type != textView.textField.keyboardType, "Changekeyboard not work")
    }

    
}
