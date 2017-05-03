//
//  SwitchBasicLayer.swift
//  homekit_dashboard
//
//  Created by ChinChin on 2017/5/2.
//  Copyright © 2017年 Chin. All rights reserved.
//

import UIKit

class SwitchBasicLayer: CALayer {
    weak var _switch: Switch?
    
    override func draw(in ctx: CGContext) {
        if let _switch = _switch {
            let cornerRadious = bounds.height * _switch.curvaceousness / 2.0
            let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadious)
            ctx.addPath(path.cgPath)
            
            let color = _switch.isOn ? _switch.highlightTintColor : _switch.switchTintColor
            ctx.setFillColor(color.cgColor)
            ctx.addPath(path.cgPath)
            ctx.fillPath()
        }
    }
}
