//
//  PricePlanViewController.swift
//  nbcUCodingChallenge
//
//  Created by Chad Murdock on 9/14/18.
//  Copyright © 2018 KarmaDeli Works. All rights reserved.
//

import UIKit

class PricePlanViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var totalChargesLabel: UILabel!
    @IBOutlet weak var hourlyStreamingCostLabel: UILabel!
    @IBOutlet weak var hourlyStreamingPlanLabel: UILabel!
    @IBOutlet weak var additionalDevicesPlanLabel: UILabel!
    @IBOutlet weak var additionalDevicesCostLabel: UILabel!
    @IBOutlet weak var LandLineChargesLabel: UILabel!
    
    var dataDict: [String:Any]?
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        print(dataDict!)
        print(getTotalCost())
        
       setLabelText()
     }
    
    //MARK:  Data Plan
    func getAdditionalDevicesDataPlan()->String{
        var planStr = "n/a"
        guard let dict = dataDict else {return planStr}
        
        if let dataCharges = dict[Utility.DATA_CHARGES] as? PricePlan, let plan = dataCharges.str{
            planStr = plan
        }
        return planStr
    }
    
    func getHourlyPackage()->String{
        var planStr = "n/a"
        guard let dict = dataDict else {return planStr}
        
        if let hourlyCharges = dict[Utility.HOURLY_CHARGES] as? PricePlan, let plan = hourlyCharges.str{
            planStr = plan
        }
        return planStr
    }
    
    //MARK: Costs
    func getLandLineCharges()->Double{
        var cost = 0.00
        guard let dict = dataDict else {return cost}
        
        if let phoneCharges = dict[Utility.PHONE_CHARGES] as? Double{
            cost = phoneCharges
        }
        return cost
    }
    
    func getAdditionalDevicesDataPlanCost()->Double{
        var cost = 0.00
        guard let dict = dataDict else {return cost}
        
        if let dataCharges = dict[Utility.DATA_CHARGES] as? PricePlan{
            cost = Double(dataCharges.price)
        }
        return cost
    }
    
    
    func getHourlyPackageCost()->Double{
        var cost = 0.00
        guard let dict = dataDict else {return cost}
        
        if let hourlyCharges = dict[Utility.HOURLY_CHARGES] as? PricePlan{
            cost = Double(hourlyCharges.price)
        }
        return cost
    }
    

    func getTotalCost()->Double{
        var sum = 0.00
        guard let dict = dataDict else {return sum}
        if let phoneCharges = dict[Utility.PHONE_CHARGES] as? Double{
            sum += phoneCharges
        }
        if let hourlyCharges = dict[Utility.HOURLY_CHARGES] as? PricePlan{
            sum += Double(hourlyCharges.price)
        }
        if let dataCharges = dict[Utility.DATA_CHARGES] as? PricePlan{
            sum += Double(dataCharges.price)
        }
        
        return sum
    }
    
    //MARK: Helper
    func setLabelText(){
        hourlyStreamingCostLabel.text = "\(Utility.getCurrencyValue(for: getHourlyPackageCost()))"
        hourlyStreamingPlanLabel.text = "\(getHourlyPackage())"
        additionalDevicesCostLabel.text = "\(Utility.getCurrencyValue(for: getAdditionalDevicesDataPlanCost()))"
        additionalDevicesPlanLabel.text = "\(getAdditionalDevicesDataPlan())"
        LandLineChargesLabel.text = "\(Utility.getCurrencyValue(for: getLandLineCharges()))"
        totalChargesLabel.text = "$\(Utility.getCurrencyValue(for: getTotalCost()))"
    }

}

