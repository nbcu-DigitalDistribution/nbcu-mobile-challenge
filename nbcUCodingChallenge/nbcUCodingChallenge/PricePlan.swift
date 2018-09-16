//
//  PricePlan.swift
//  nbcUCodingChallenge
//
//  Created by Chad Murdock on 9/14/18.
//  Copyright © 2018 KarmaDeli Works. All rights reserved.
//

import Foundation

class PricePlan{
    var price = Int()
    var plan = Int()
    
    var str: String?{
        if plan == 1{
            return "1GB Plan"
        }
        if plan == 2 {
            return "2GB Plan"
        }
        if plan == 5{
            return "5GB Plan"
        }
        if plan == 8{
            return "8GB Plan"
        }
        if plan >= 9{
            return "8GB+ Plan"
        }
        return nil
    }
    
}






