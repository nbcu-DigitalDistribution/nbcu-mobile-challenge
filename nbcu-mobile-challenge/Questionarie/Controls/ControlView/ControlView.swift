//
//  ControlView.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/10/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import UIKit

protocol ControlViewDelegate {
    func clickOnButton(_ isNext:Bool)
}

class ControlView: UIView {
    var delegate: ControlViewDelegate?
    
    private func myInit() {
        self.backgroundColor = .white
        
        let preButton = getButton(true)
        preButton.setTitle("Previous", for: .normal)
        preButton.addTarget(self, action: #selector(preAction(_:)), for: .touchUpInside)
        preButton.setTitleColor(.gray, for: .normal)
        self.addSubview(preButton)
        
        let nextButton = getButton(false)
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.primary, for: .normal)
        nextButton.addTarget(self, action: #selector(nextAction(_:)), for: .touchUpInside)
        self.addSubview(nextButton)
        
        bindToKeyboard()
    }
    
    private func getButton(_ isFirst: Bool) -> UIButton {
        let width = self.bounds.width * 0.5
        let height = self.bounds.height
        let x = isFirst ? 0 : width
        let button = UIButton(frame: CGRect(x: x, y: 0, width: width, height: height))
        return button
    }
    
    @objc func preAction(_ sender: UIButton) {
        delegate?.clickOnButton(false)
    }
    
    @objc func nextAction(_ sender: UIButton) {
        delegate?.clickOnButton(true)
    }
    
    //MARK: Move along Keyboard
    func bindToKeyboard () {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame , object: nil)
    }
    
    @objc func keyboardWillChange(_ notification : NSNotification) {
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let startingFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {self.frame.origin.y += deltaY
        },completion: nil)

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
