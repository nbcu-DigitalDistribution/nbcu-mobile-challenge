//
//  PlanGenerator.swift
//  nbcu-mobile-challenge
//
//  Created by Honglin Yi on 9/11/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import Foundation

struct PlanGenerator {
    private var results: [SurveyResultModel]
    private var hours = 0
    private var devices = 0
    
    init(results: [SurveyResultModel]) {
        self.results = results
        getHoursDevices(results)
    }
    
    private mutating func getHoursDevices(_ results: [SurveyResultModel]) {
        guard results.count >= 4 else { return }
        if results[0].resultType == .Number {
            hours = Int(results[0].result) ?? 0
        }
        if results[1].resultType == .Number {
            devices = Int(results[1].result) ?? 0
        }
    }
    
}
