//
//  Utility.swift
//  nbcUCodingChallenge
//
//  Created by Chad Murdock on 9/14/18.
//  Copyright © 2018 KarmaDeli Works. All rights reserved.
//

import Foundation
import UIKit

class Utility{
    
    static var dataPlanDict = [1:3,2:5,5:8,8:15]
    static let INC = "inc"
    static let DEC = "dec"
    static let INCREMENTS = "increments"
    static let DATA_PLAN = "dataPlan"
    static let DECREMENTS = "decrements"
    static let MAX = "max"
    static let QUO = "quo"
    static let DATA_CHARGES = "dataCharges"
    static let DATA_USAGE = "dataUsage"
    static let HOURLY_CHARGES = "hourlyCharges"
    static let PHONE_CHARGES = "phoneCharges"
    
     static func assessExtraDataCost(dataUse: Int) -> Int{
        let costOfAdditionalData = (dataUse - 8) / 2
        return costOfAdditionalData
    }
    
    static func getCurrencyValue(for amount: Double)->String{
        let str = String(describing: amount)
        var arr = str.split(separator: ".")
        guard let int = Int(arr[1]) else {return str}
        if int < 10 {
            var metaArr = ["\(arr[0])"]
            metaArr.append("\(arr[1])\(0)")
            return "\(metaArr[0]).\(metaArr[1])"
        }
        return str
    }
    
    static func getPlanandPrice(dict: [String:Any])-> PricePlan{
        let pricePlan = PricePlan()
        var increments = Int()
        var decrements = Int()
        var incrementalDataPlan = Int()
        var decrementalDataPlan = Int()
        var additionChargeForMax = Int()
        //unwrap and check dictionary for keys to determine the plan and price
        if let inc = dict[INC] as? [String:Any], let aincrements = inc[INCREMENTS] as? Int, let adataPlanInc = inc[DATA_PLAN] as? Int{
            increments = aincrements
            incrementalDataPlan = adataPlanInc
        }
        if let dec = dict[DEC] as? [String:Any], let adecrements = dec[DECREMENTS] as? Int, let adataPlanDec = dec[DATA_PLAN] as? Int{
            decrements = adecrements
            decrementalDataPlan = adataPlanDec
        }
        
        if let maxPlan = dict[MAX] as? [String:Any], let dataUsage = maxPlan[DATA_USAGE] as? Int, let dataPlan = maxPlan[DATA_PLAN] as? Int{
            additionChargeForMax = assessExtraDataCost(dataUse: dataUsage)
            pricePlan.price = 15 + additionChargeForMax
            pricePlan.plan = dataPlan
        }
        if let quo = dict[QUO] as? [String:Any], let dataPlan = quo[DATA_PLAN] as? Int{
            pricePlan.plan = dataPlan;
            if let price = Utility.dataPlanDict[dataPlan]{
                pricePlan.price = price
            }
        }
        if increments > 0 && decrements > 0{
            if increments < decrements{
                pricePlan.plan = incrementalDataPlan;
                if let price = Utility.dataPlanDict[incrementalDataPlan]{
                    pricePlan.price = price
                }
            }else{
                pricePlan.plan = decrementalDataPlan;
                if let price = Utility.dataPlanDict[decrementalDataPlan]{
                    pricePlan.price = price
                }
            }
        }
        return pricePlan
    }
    
   static func checkForAdditionalHours(totalTime: Int)->Int{
        let additionHours = totalTime - 8
        return additionHours
    }
    
    static func determinePlan(dataUsage: Int)->[String:Any]{
        let planArr = [1,2,5,8,9]
        var dict = [String:Any]()
        if !planArr.contains(dataUsage) && dataUsage < 9{
            var metaArr = planArr
            metaArr.append(dataUsage)
            metaArr = metaArr.sorted()
            for (idx,plan) in metaArr.enumerated(){
                if plan == dataUsage{
                    //finds the passed in dataUsage and its closest matching plan.
                    var i = metaArr[idx]; var d = metaArr[idx]
                    var increments = 0; var decrements = 0
                    var incrementMatch = false; var decrementMatch = false
                    
                    while idx < metaArr.count - 1 && incrementMatch == false{
                        if planArr.contains(i){
                            dict[INC] = [INCREMENTS:increments, DATA_PLAN:i]
                            incrementMatch = true
                        }
                        i+=1
                        increments+=1
                    }
                    while d > 0 && decrementMatch == false{
                        if planArr.contains(d){
                            decrementMatch = true
                            dict[DEC] = [DECREMENTS:decrements, DATA_PLAN:d]
                        }
                        d-=1
                        decrements+=1}
                }
            }
        }
        else if planArr.contains(dataUsage) && dataUsage < 9 {
            for (_, plan) in planArr.enumerated(){
                if plan == dataUsage{
                    dict[QUO] = [DATA_PLAN:plan]
                }
            }
        }
        else if dataUsage > 8 {
            dict[MAX] = [DATA_PLAN:9, DATA_USAGE:dataUsage]
            
        }
        return dict
    }
    
    
}








