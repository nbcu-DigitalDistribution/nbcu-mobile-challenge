//
//  ViewController.swift
//  nbcUCodingChallenge
//
//  Created by Chad Murdock on 9/13/18.
//  Copyright © 2018 KarmaDeli Works. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var landlineSwitchOutlet: UISwitch!
    @IBOutlet weak var AsiaSwitch: UISwitch!
    @IBOutlet weak var europeSwitch: UISwitch!
    @IBOutlet weak var restOfTheWorldSwitch: UISwitch!
    @IBOutlet weak var worldSwitch: UISwitch!
    @IBOutlet weak var hoursTextField: UITextField!
    @IBOutlet weak var totalDevicesTextField: UITextField!
    @IBOutlet weak var concurrentStreamsTextField: UITextField!
    
    private var isClearedToPush = Bool()
  
    //MARK: Switch Actions
    @IBAction func WorldSwitchAction() {
        toggleWorld()
    }
    
    @IBAction func landlineSwitch() {
        toggleLandLine()
    }
    
    
    //MARK: Calculations
    @IBAction func calculateAction() {
        nilCheck()
        if isClearedToPush{
            let totalChargesDict: [String:Any] = calculateTotalCharges()
            performSegue(withIdentifier: "toPricePlan", sender: totalChargesDict)
        }
       
    }
    
    func sumPhoneCharges()->Double{
        var sum = 0.00
        if AsiaSwitch.isOn{
            sum+=4.99
        }
        if europeSwitch.isOn{
            sum+=4.99
        }
        if restOfTheWorldSwitch.isOn{
            sum+=4.99
        }
        if worldSwitch.isOn{
            sum+=11.99
        }
        if landlineSwitchOutlet.isOn{
            sum+=25.99
        }
        return sum
    }
    
    func calculateTotalCharges()->[String:Any]{
        let dummyDict = [String:Any]()
        guard let hours = hoursTextField.text else {return dummyDict}
        let hoursInt = Int(hours)
        guard let realHours = hoursInt else {return dummyDict}
        
        guard let devices = totalDevicesTextField.text else {return dummyDict}
        let deviceInt = Int(devices)
        guard let realDevices = deviceInt else {return dummyDict}
        
        guard let concurrentStreams = concurrentStreamsTextField.text else {return dummyDict}
        let concurrentStreamsInt = Int(concurrentStreams)
        guard let realconcurrentStreams = concurrentStreamsInt else {return dummyDict}
        
        let aPackage = Package(hours: realHours, devices: realDevices, concurrentStreams: realconcurrentStreams)
        //assess hourly use
        aPackage.assessHourlyCost()
        let hourlyDataUse = aPackage.getDataUse()
        let hourlyDataDict = Utility.determinePlan(dataUsage: hourlyDataUse)
        //assess data used by additional devices
        let additionalDataUsage = aPackage.getAdditionalDevices() + aPackage.getConcurrentStreamingDevices()
        let deviceDataDict = Utility.determinePlan(dataUsage: additionalDataUsage)
        //assigns price and plan
        let dataCharges = Utility.getPlanandPrice(dict: deviceDataDict)
        let hourlyCharges = Utility.getPlanandPrice(dict: hourlyDataDict)
        
        let totalChargesDict: [String:Any] = [Utility.DATA_CHARGES: dataCharges,
                                              Utility.HOURLY_CHARGES: hourlyCharges,
                                              Utility.PHONE_CHARGES: sumPhoneCharges()]
        return totalChargesDict
    }
    
   
    //MARK: Main Toggle Switches
    func toggleLandLine(){
        if !landlineSwitchOutlet.isOn{
            worldSwitch.isOn = false; worldSwitch.isEnabled = false
            AsiaSwitch.isOn = false; AsiaSwitch.isEnabled = false
            europeSwitch.isOn = false; europeSwitch.isEnabled = false
            restOfTheWorldSwitch.isOn = false; restOfTheWorldSwitch.isEnabled = false
        }
        else{
            AsiaSwitch.isEnabled = true
            europeSwitch.isEnabled = true
            restOfTheWorldSwitch.isEnabled = true
            worldSwitch.isEnabled = true
        }
    }
    
    func toggleWorld(){
        if worldSwitch.isOn{
            AsiaSwitch.isOn = false; AsiaSwitch.isEnabled = false
            europeSwitch.isOn = false; europeSwitch.isEnabled = false
            restOfTheWorldSwitch.isOn = false; restOfTheWorldSwitch.isEnabled = false
        }
        else{
            AsiaSwitch.isEnabled = true
            europeSwitch.isEnabled = true
            restOfTheWorldSwitch.isEnabled = true
        }
    }
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
   
        toggleLandLine()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let data = sender as? [String:Any]{
            if let vc = segue.destination as? PricePlanViewController{
                vc.dataDict = data
            }
        }
    }
    
    //MARK: Helper Functions
    func nilCheck(){
        isClearedToPush = true //ensures the alertVC doesn't block the segue
        if hoursTextField.text == "" ||  totalDevicesTextField.text == "" || concurrentStreamsTextField.text == ""{
            isClearedToPush = false
            let alertVC = UIAlertController(title: "Missing Values", message: "Please enter a value of 0 or greater in all the textfields", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                alertVC.dismiss(animated: true, completion: nil)
            }))
            present(alertVC, animated: true, completion: nil)
        }
    }
    
    @objc
    func tapped(){
        hoursTextField.endEditing(true)
        totalDevicesTextField.endEditing(true)
        concurrentStreamsTextField.endEditing(true)
    }
    


}

