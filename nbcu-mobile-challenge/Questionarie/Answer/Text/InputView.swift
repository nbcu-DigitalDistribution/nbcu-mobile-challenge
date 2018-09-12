//
//  InputView.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/10/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import UIKit

class InputView: UIView {
    
    //MARK: API
    
    public func getCurrentValue() -> String? {
        return textField.text
    }
    
    public func changeUnit(unit: String) {
        unitLabel.text = unit
        let width = unit.widthWithConstrainedHeight(height: unitLabel.bounds.height, font: font)
        unitLabel.frame = CGRect(x: unitLabel.frame.maxX - width, y: unitLabel.frame.minY, width: width, height: unitLabel.frame.height)
    }
    
    public func changeKeyboard(isNumber: Bool) {
        guard !isNumber else { return }
        textField.keyboardType = .asciiCapable
    }
    
    //MARK: Layout
    
    private let font = UIFont.systemFont(ofSize: 20)
    
    lazy var textField:UITextField = {
        let view = UITextField(frame: CGRect(x: 10, y: 10, width: self.bounds.width - 20, height: self.bounds.height - 20))
        view.font = font
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.primary.cgColor
        border.frame = CGRect(x: 0, y: view.frame.height - width, width: view.frame.width, height: view.frame.height)
        border.borderWidth = width
        view.layer.addSublayer(border)
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var unitLabel: UILabel = {
        let view = UILabel(frame: CGRect(x: self.bounds.width - 100, y: 0, width: 80, height: self.bounds.height))
        view.textColor = .gray
        view.textAlignment = .right
        return view
    }()
    
    private func myInit() {
       self.addSubview(textField)
       self.addSubview(unitLabel)
       self.textField.keyboardType = .numberPad
       self.textField.becomeFirstResponder()
    }

    //MARK: Boilplate Init Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        myInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        myInit()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        myInit()
    }
}

#if DEBUG
extension InputView {
    public func exposeUnitLabel() -> UILabel {
        return self.unitLabel
    }
}
#endif
