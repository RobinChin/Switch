//
//  SwitchThumbLayer.swift
//  homekit_dashboard
//
//  Created by ChinChin on 2017/5/2.
//  Copyright © 2017年 Chin. All rights reserved.
//

import UIKit

class SwitchThumbLayer: CALayer {
    var highlighted = false {
        didSet {
            setNeedsDisplay()
        }
    }
    weak var _switch: Switch?
    
    override func draw(in ctx: CGContext) {
        if let _switch = _switch {
            let cornerRadious = bounds.height * _switch.curvaceousness / 2.0
            let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadious)
            
            ctx.setFillColor(_switch.thumbTintColor.cgColor)
            ctx.addPath(path.cgPath)
            ctx.fillPath()
            
            let shadowColor = UIColor.gray
            ctx.setShadow(offset: CGSize(width: 0.0, height: 1.0), blur: 1.0, color: shadowColor.cgColor)
            
            ctx.setStrokeColor(shadowColor.cgColor)
            ctx.setLineWidth(0.5)
            ctx.addPath(path.cgPath)
            ctx.strokePath()
            
            if highlighted {
                ctx.setFillColor(UIColor(white: 0.0, alpha: 0.1).cgColor)
                ctx.addPath(path.cgPath)
                ctx.fillPath()
            }
        }
    }
}
