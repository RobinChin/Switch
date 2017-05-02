//
//  Switch.swift
//  homekit_dashboard
//
//  Created by ChinChin on 2017/4/25.
//  Copyright © 2017年 Chin. All rights reserved.
//

import UIKit

class Switch: UIControl {

    var isOn: Bool = false {
        didSet {
            updateFrames()
        }
    }
    
    var switchTintColor: UIColor = UIColor(white: 0.9, alpha: 1.0) {
        didSet {
            basicLayer.setNeedsDisplay()
        }
    }
    
    var highlightTintColor: UIColor = UIColor(red: 0.0, green: 0.45, blue: 0.94, alpha: 1.0) {
        didSet {
            basicLayer.setNeedsDisplay()
        }
    }
    
    var thumbTintColor: UIColor = UIColor.white {
        didSet {
            switchLayer.setNeedsDisplay()
        }
    }
    
    var curvaceousness: CGFloat = 0.5 {
        didSet {
            basicLayer.setNeedsDisplay()
            switchLayer.setNeedsDisplay()
        }
    }
    
    let basicLayer = SwitchBasicLayer()
    let switchLayer = SwitchThumbLayer()
    
    override var frame: CGRect {
        didSet {
            updateFrames()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        basicLayer._switch = self
        basicLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(basicLayer)
        
        switchLayer._switch = self
        switchLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(switchLayer)
        
        updateFrames()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateFrames() {
        
        basicLayer.frame = bounds.insetBy(dx: 0.0, dy: 0.0)
        basicLayer.setNeedsDisplay()
        
        let x = isOn ? bounds.width/2 : 0.0
        switchLayer.frame = CGRect(x: x, y: 0.0, width: bounds.width / 2, height: bounds.height)
        switchLayer.setNeedsDisplay()
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        
        if switchLayer.frame.contains(location) {
            switchLayer.highlighted = true
            isOn = !isOn
            sendActions(for: .valueChanged)
            return true
        }
        return false
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        switchLayer.highlighted = false
    }
}
