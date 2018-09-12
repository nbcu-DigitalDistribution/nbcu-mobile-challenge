//
//  HeaderView.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/6/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    private let font = UIFont.systemFont(ofSize: 20)
    private lazy var textV:UITextView = {
        let newView = UITextView(frame: CGRect.zero)
        newView.font = font
        newView.isUserInteractionEnabled = false
        newView.textColor = UIColor.primary
        self.addSubview(newView)
        return newView
    }()

    func setData(title: String?) {
        guard let title = title else { return }
        let left: CGFloat  = 10
        self.textV.text = title
        let height = title.heightWithConstrainedWidth(width: self.frame.width - left * 2, font: font) + 26
        let frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: height)
        self.textV.frame = CGRect(x: left, y: 0, width: self.frame.width - left * 2, height: height)
        self.frame = frame
    }
    
}


