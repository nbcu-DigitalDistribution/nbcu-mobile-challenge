//
//  AnswerModel.swift
//  nbcu-mobile-challenge
//
//  Created by Honglin Yi on 9/11/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import UIKit

enum ResultType {
    case Number
    case String
}

struct AnswerModel {
    
    let question: String
    let dic: [String: [String]]
    let isNumber: Bool
    let unit: String
    let resultType: ResultType
    
    init(question: String, dic: [String: [String]] = [:], isNumber: Bool = false,
         unit: String = "", resultType: ResultType = .String) {
        self.question = question
        self.dic = dic
        self.isNumber = isNumber
        self.unit = unit
        self.resultType = resultType
    }
}

extension AnswerModel {
    
    func getController() -> (UIViewController, AnswerController) {
        guard isNumber != true else  {
            let controller = TextController()
            controller.setData(self)
            return (controller, controller)
        }
        let controller = ChoiceController()
        controller.setData(self)
        return (controller, controller)
    }
    
}
