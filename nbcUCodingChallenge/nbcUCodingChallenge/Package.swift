//
//  Package.swift
//  nbcUCodingChallenge
//
//  Created by Chad Murdock on 9/13/18.
//  Copyright © 2018 KarmaDeli Works. All rights reserved.
//

import Foundation

class Package{
    private var dataUse: Int = 0
    private var cost: Int = 0
    private var hours: Int
    private var devices: Int
    private var concurrentStreams: Int
    
    init(hours: Int, devices: Int, concurrentStreams: Int){
        self.hours = hours
        self.devices = devices
        self.concurrentStreams = concurrentStreams
    }
    
    func getDataUse()->Int{
       return dataUse
    }
    
    
    func assessHourlyCost(){
        if hours == 1{
            dataUse += 1
            cost += 3
        }
        else if hours >= 2 && hours <= 3{
            dataUse += 2
            cost += 5
        }
        else if hours >= 3 && hours <= 5{
            dataUse += 5
            cost += 8
        }
        else if hours >= 5 && hours <= 8{
            dataUse += 8
            cost += 15
        }
        else if hours > 8{
            //assess additional dataUse and costs
            dataUse += 8 + Utility.checkForAdditionalHours(totalTime: hours)
            cost += 15 + Utility.assessExtraDataCost(dataUse: hours)
        }
    }
    
    
    func getAdditionalDevices()->Int{
       var count = 0
        if devices > 2{
            for _ in 1...devices-2{
                count+=1
            }
        }
        return count
    }
    
    func getConcurrentStreamingDevices()->Int{
        var count = 0
        //concurrency requires 2 or more streams
        if concurrentStreams >= 2 {
        for _ in 1...concurrentStreams{
            count += 1
            }
        }
        return count
    }
    
    
    
}








