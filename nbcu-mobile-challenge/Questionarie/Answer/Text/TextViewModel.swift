//
//  TextViewModel.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/10/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import Foundation
import UIKit

class TextViewModel: NSObject {
    var question: String = ""
    var unit: String = ""
    var isNumber: Bool = false
    
    func addData(question: String, unit: String?, isNumber: Bool) {
        self.question = question
        if let unit = unit {
            self.unit = unit
        }
        self.isNumber = isNumber
    }
    
}


