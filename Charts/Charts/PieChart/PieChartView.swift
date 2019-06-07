//
//  PieChartView.swift
//  Charts
//
//  Created by abhinav khanduja on 26/05/19.
//  Copyright © 2019 abhinav khanduja. All rights reserved.
//

import UIKit

class PieChartView: UIView {
    
    var pieChartValues : [Double] = [0.2, 0.1, 0.5, 0.2]
    
    var color : [CGColor] = [UIColor.red.cgColor, UIColor.gray.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor]
    
    var pieChartRadius : CGFloat = 50
    
    var arcWidth : CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setView()
    }
    
    func setView() {
        backgroundColor = .white
//        pieChartRadius = min(self.frame.width, self.frame.height)/2 - arcWidth
        print("pie chart radius is ",pieChartRadius)
    }

    override func draw(_ rect: CGRect) {
        print("draw initiated")
        guard let context = UIGraphicsGetCurrentContext() else {
            print("could not get context")
            return
        }
        drawCircle(context: context)
        setNeedsDisplay()
    }
    
    func updateView() {
        guard let context = UIGraphicsGetCurrentContext() else {
            print("could not get context")
            return
        }
        drawCircle(context: context)
        setNeedsDisplay()
    }
    
    private func drawCircle(context : CGContext) {
        let centerPoint = CGPoint(x: bounds.width/2, y: bounds.height/2)
        
        var startAngle = CGFloat(0 * Double.pi/180)
        
        for i in 0..<pieChartValues.count {
            context.addArc(center: centerPoint, radius: pieChartRadius, startAngle: startAngle, endAngle: CGFloat(pieChartValues[i] * 360 * Double.pi/180), clockwise: true)
            context.setLineWidth(100)
            context.setStrokeColor(color[i])
            context.strokePath()
            startAngle = CGFloat(pieChartValues[i] * 360 * Double.pi/180)
        }
    }

}
