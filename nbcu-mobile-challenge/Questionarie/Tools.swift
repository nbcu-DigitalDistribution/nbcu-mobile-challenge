//
//  Tools.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/10/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T? {
        let bundle = Bundle(for: T.self)
        let nibs = bundle.loadNibNamed(String(describing: T.self), owner: nil, options: nil)
        guard let view = nibs?.first as? T else { return nil}
        return view
    }
}

extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedStringKey.font: font], context: nil)
        return boundingBox.height
    }
    func widthWithConstrainedHeight(height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedStringKey.font: font], context: nil)
        return boundingBox.width
    }
}

extension UIColor {
    static let primary:UIColor = {
        return UIColor(red: 64.0/255.0, green: 0.0/255.0, blue: 149.0/255.0, alpha: 1.0)
    }()
    static let selected:UIColor = {
        return UIColor(red: 64.0/255.0, green: 0.0/255.0, blue: 149.0/255.0, alpha: 0.19)
    }()
}

