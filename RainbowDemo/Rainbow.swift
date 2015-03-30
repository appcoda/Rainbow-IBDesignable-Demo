//
//  Rainbow.swift
//  RainbowDemo
//
//  Created by Simon Ng on 29/3/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable
class Rainbow: UIView {
    @IBInspectable var firstColor: UIColor = UIColor(red: (37.0/255.0), green: (252.0/255), blue: (244.0/255.0), alpha: 1.0) {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor(red: (171.0/255.0), green: (250.0/255), blue: (81.0/255.0), alpha: 1.0) {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var thirdColor: UIColor = UIColor(red: (238.0/255.0), green: (32.0/255), blue: (53.0/255.0), alpha: 1.0) {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var innerCircleRadius:CGFloat = 80 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var middleCircleRadius:CGFloat = 150 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var outerCircleRadius:CGFloat = 215 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func drawRect(rect: CGRect) {
        // Add ARCs
        self.addCirle(innerCircleRadius, capRadius: 20, color: self.firstColor)
        self.addCirle(middleCircleRadius, capRadius: 20, color: self.secondColor)
        self.addCirle(outerCircleRadius, capRadius: 20, color: self.thirdColor)
    }
    
    func addCirle(arcRadius: CGFloat, capRadius: CGFloat, color: UIColor) {
        let X = CGRectGetMidX(self.bounds)
        let Y = CGRectGetMidY(self.bounds)
        
        // Bottom Oval
        let pathBottom = UIBezierPath(ovalInRect: CGRectMake((X - (arcRadius/2)), (Y - (arcRadius/2)), arcRadius, arcRadius)).CGPath
        self.addOval(20.0, path: pathBottom, strokeStart: 0, strokeEnd: 0.5, strokeColor: color, fillColor: UIColor.clearColor(), shadowRadius: 0, shadowOpacity: 0, shadowOffsset: CGSizeZero)
        
        // Middle Cap
        let pathMiddle = UIBezierPath(ovalInRect: CGRectMake((X - (capRadius/2)) - (arcRadius/2), (Y - (capRadius/2)), capRadius, capRadius)).CGPath
        self.addOval(0.0, path: pathMiddle, strokeStart: 0, strokeEnd: 1.0, strokeColor: color, fillColor: color, shadowRadius: 5.0, shadowOpacity: 0.5, shadowOffsset: CGSizeZero)

        // Top Oval
        let pathTop = UIBezierPath(ovalInRect: CGRectMake((X - (arcRadius/2)), (Y - (arcRadius/2)), arcRadius, arcRadius)).CGPath
        self.addOval(20.0, path: pathTop, strokeStart: 0.5, strokeEnd: 1.0, strokeColor: color, fillColor: UIColor.clearColor(), shadowRadius: 0, shadowOpacity: 0, shadowOffsset: CGSizeZero)
        
    }

    func addOval(lineWidth: CGFloat, path: CGPathRef, strokeStart: CGFloat, strokeEnd: CGFloat, strokeColor: UIColor, fillColor: UIColor, shadowRadius: CGFloat, shadowOpacity: Float, shadowOffsset: CGSize) {
        
        let arc = CAShapeLayer()
        arc.lineWidth = lineWidth
        arc.path = path
        arc.strokeStart = strokeStart
        arc.strokeEnd = strokeEnd
        arc.strokeColor = strokeColor.CGColor
        arc.fillColor = fillColor.CGColor
        arc.shadowColor = UIColor.blackColor().CGColor
        arc.shadowRadius = shadowRadius
        arc.shadowOpacity = shadowOpacity
        arc.shadowOffset = shadowOffsset
        layer.addSublayer(arc)
    }
}