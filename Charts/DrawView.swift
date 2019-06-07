//
//  DrawView.swift
//  Charts
//
//  Created by abhinav khanduja on 26/05/19.
//  Copyright © 2019 abhinav khanduja. All rights reserved.
//

import UIKit

class DrawView: UIView {

    var pieArr : [Double] = [0.2, 0.1, 0.5, 0.2]
    var color : [CGColor] = [UIColor.red.cgColor, UIColor.gray.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor]
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        print("draw called")
        guard let context = UIGraphicsGetCurrentContext() else {
            print("could not get context")
            return
        }
//        drawRectangle(context: context, isFilled: true)
        drawCircle(context: context, isFilled: false)
    }

    private func drawRectangle(context : CGContext, isFilled : Bool) {
        let strokeDistance : CGFloat = 25
        let centerPoint = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let lowerLeftCorner = CGPoint(x: centerPoint.x - strokeDistance, y: centerPoint.y + strokeDistance)
        let lowerRightCorner = CGPoint(x: centerPoint.x + strokeDistance, y: centerPoint.y + strokeDistance)
        let upperLeftCorner = CGPoint(x: centerPoint.x - strokeDistance, y: centerPoint.y - strokeDistance)
        let upperRightCorner = CGPoint(x: centerPoint.x + strokeDistance, y: centerPoint.y - strokeDistance)
        
        context.move(to: lowerLeftCorner)
        context.addLine(to: lowerLeftCorner)
        context.addLine(to: lowerRightCorner)
        context.addLine(to: upperRightCorner)
        context.addLine(to: upperLeftCorner)
        context.addLine(to: lowerLeftCorner)
        context.setLineCap(.square)
        context.setLineWidth(10)
        
        if isFilled {
            context.setFillColor(UIColor.blue.cgColor)
            context.fillPath()
            return
        }
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.strokePath()
    }
    
    private func drawCircle(context : CGContext, isFilled : Bool) {
        let centerPoint = CGPoint(x: bounds.width/2, y: bounds.height/2)
        
        var startAngle = CGFloat(0 * Double.pi/180)
        
//        context.addArc(center: centerPoint, radius: 50, startAngle: startAngle, endAngle: CGFloat(pieArr[0] * 360 * Double.pi/180), clockwise: true)
//        context.setStrokeColor(color[0])
//        context.setLineWidth(10)
//        context.strokePath()
//        startAngle = CGFloat(pieArr[0] * 360 * Double.pi/180)
//
//        context.addArc(center: centerPoint, radius: 50, startAngle: startAngle, endAngle: CGFloat(pieArr[1] * 360 * Double.pi/180), clockwise: true)
//        context.setStrokeColor(color[1])
//        context.setLineWidth(10)
//        context.strokePath()
//        startAngle = CGFloat(pieArr[1] * 360 * Double.pi/180)
//
//        context.addArc(center: centerPoint, radius: 50, startAngle: startAngle, endAngle: CGFloat(pieArr[2] * 360 * Double.pi/180), clockwise: true)
//        context.setStrokeColor(color[2])
//        context.setLineWidth(10)
//        context.strokePath()
//        startAngle = CGFloat(pieArr[2] * 360 * Double.pi/180)
        
        for i in 0..<pieArr.count {
            context.addArc(center: centerPoint, radius: 50, startAngle: startAngle, endAngle: CGFloat(pieArr[i] * 360 * Double.pi/180), clockwise: true)
            context.setStrokeColor(color[i])
            context.setLineWidth(100)
            context.strokePath()
            startAngle = CGFloat(pieArr[i] * 360 * Double.pi/180)
        }
        
//        context.setLineWidth(10)
//        context.setStrokeColor(UIColor.red.cgColor)
//        context.strokePath()
    }

}
