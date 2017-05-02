//
//  ViewController.swift
//  Switch
//
//  Created by ChinChin on 2017/5/2.
//  Copyright © 2017年 Chin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let mySwitch = Switch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mySwitch)
        mySwitch.addTarget(self, action: #selector(switchHandle), for: .valueChanged)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let bounds = UIScreen.main.bounds
        let margin: CGFloat = 40.0
        let width = view.bounds.width - 2.0 * margin
        mySwitch.frame = CGRect(x: margin, y: margin + bounds.height / 2, width: width, height: 90.0)
    }
    
    func switchHandle() {
        print(mySwitch.isOn)
    }
}

