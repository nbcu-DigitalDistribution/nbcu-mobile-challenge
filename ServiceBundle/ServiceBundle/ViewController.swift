//
//  ViewController.swift
//  ServiceBundle
//
//  Created by Erica on 9/9/18.
//  Copyright © 2018 Erica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelQ1: UILabel!
    
    @IBOutlet weak var labelQ2: UILabel!
    
    @IBOutlet weak var labelQ3: UILabel!
    
    
    @IBOutlet weak var segmentedControl1: UISegmentedControl!
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var bundleButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
     beginningUI()
        
    
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       
        
        UICustomization()
        
    }

  
    func beginningUI() {
        labelQ1.isHidden = true
        labelQ2.isHidden = true
        labelQ3.isHidden = true
       // labebel4.isHidden = true
        textField1.isHidden = true
        textField2.isHidden = true
        segmentedControl1.isHidden = true
        
        
        
        
    }
    

    func UICustomization() {
        
        //segmentedController
        let xPostion:CGFloat = 10
        let yPostion:CGFloat = 150
        let elementWidth:CGFloat = 300
        let elementHeight:CGFloat = 30
        
        segmentedControl1.frame = CGRect(x: xPostion, y: yPostion, width: elementWidth, height: elementHeight)
        segmentedControl1.tintColor = UIColor.green
        segmentedControl1.backgroundColor = UIColor.lightGray
        
        //bundleButton UI
        bundleButton.layer.cornerRadius = 5
        bundleButton.layer.masksToBounds = true
        
    }
    
    


}

