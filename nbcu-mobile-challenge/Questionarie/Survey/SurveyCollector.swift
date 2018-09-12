//
//  AnswerCollector.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/11/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import Foundation

struct SurveyCollector {
    var index: Int = 0
    var answers = [SurveyResultModel]()
    
    mutating func modifyResult(At i: Int, result: String, resultType: ResultType) {
        guard i >= 0, i <= answers.count else { return }
        guard i == answers.count  else {
            answers[i].changeResult(result)
            return
        }
        let answer = SurveyResultModel(result: result, resultType: resultType)
        answers.append(answer)
    }
    
    func toString() -> String {
        return answers.reduce("All Answers: ") { result, answer in
            result + answer.result
        }
    }
    
}

struct SurveyResultModel {
    var result: String
    let resultType: ResultType
    
    mutating func changeResult(_ result: String) {
        self.result = result
    }
}
