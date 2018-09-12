//
//  ChoiceViewModelItem.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/6/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import Foundation

class ChoiceViewModelItem {
    
    public private(set) var title: String
    public private(set) var subTitles:[String]
    public private(set) var rowCount = 1
    public private(set) var isCollapsible = false
    public var isCollapsed = false {
        didSet {
            self.rowCount = (isCollapsed ? subTitles.count+1 : 1)
        }
    }
    
    init(title:String, subTitles:[String]) {
        self.title = title
        self.subTitles = subTitles
        guard subTitles.count > 0 else {return}
        self.rowCount = 1
        self.isCollapsible = true
    }
}
