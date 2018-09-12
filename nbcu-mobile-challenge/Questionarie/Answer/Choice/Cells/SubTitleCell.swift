//
//  SubTitleCell.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/10/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import UIKit

class SubTitleCell: UITableViewCell {
    @IBOutlet weak var textV: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.selected
        self.selectedBackgroundView = bgColorView
        textV.isUserInteractionEnabled = false
        textV.isScrollEnabled = false
    }
    func setData(title: String?) {
        guard let title = title else { return }
        self.textV.text = title
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        textV.textColor = UIColor.black
        if selected {
            textV.textColor = UIColor.primary
        }
    }
    
}
