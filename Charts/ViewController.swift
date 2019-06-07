//
//  ViewController.swift
//  Charts
//
//  Created by abhinav khanduja on 23/05/19.
//  Copyright © 2019 abhinav khanduja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var barValues : [Double] = [10.8,12.44,33.5,14.5,19,100,10.8,12.44,33.5,14.5,19,100,10.8,12.44,33.5,14.5,19,100,10.8,12.44,33.5,14.5,19,100]
    
    @IBOutlet weak var barChartView: BarChartView!
    
    var spacing : CGFloat = 10
    var cellWidth : CGFloat = 30
    
    let colors : [CGColor] = [#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)]
    
    @IBOutlet weak var barChartCollView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChartView.barValues = barValues
        barChartView.colors = colors
        barChartView.barCellWidth = 30
        barChartView.barCellSpacing = spacing
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = maskPath.cgPath
        layer.mask = shapeLayer
    }
    
    func setGradientColor(bounds : CGRect, colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
//        gradientLayer.locations = [0.0, 0.5]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

