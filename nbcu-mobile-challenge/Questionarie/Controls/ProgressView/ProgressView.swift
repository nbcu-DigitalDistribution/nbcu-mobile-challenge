//
//  ProgressView.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/11/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import UIKit


public class ProgressView: UIView {
    @IBOutlet weak var progressV: UIProgressView!
    @IBOutlet weak var leftL: UILabel!
    @IBOutlet weak var rightL: UILabel!
    private var max = 1
    private var value = 0
    
    private func myInit() {
        //setValueMax(value: self.value, max: self.max)
    }
    public func setValueMax(value: Int?, max: Int?) {
        if let max = max {
            setMaxValue(max)
        }
        if let value = value {
            setProgress(value)
        }
    }
    private func setMaxValue(_ max: Int) {
        self.max = max
        self.rightL.text = String(self.max)
    }
    private func setProgress(_ value: Int) {
        guard value <= max else {
            return
        }
        self.value = value
        let progress = Float(self.value) / Float(self.max)
        self.progressV.setProgress(progress, animated: true)
        self.leftL.text = String(self.value)
    }
    
    //MARK: Boilplate Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        myInit()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        myInit()
    }
    override public func awakeFromNib() {
        super.awakeFromNib()
        myInit()
    }
    
}
