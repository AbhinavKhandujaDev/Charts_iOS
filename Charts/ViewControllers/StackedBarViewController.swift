//
//  StackedBarViewController.swift
//  Charts
//
//  Created by abhinav khanduja on 07/06/19.
//  Copyright © 2019 abhinav khanduja. All rights reserved.
//

import UIKit

class StackedBarViewController: UIViewController {

    @IBOutlet weak var stackedBarView: StackedBarChartView!
    
    var barVals : [[Double]] = [[30,30],
                                [10.8,12.44,100],
                                [10.8,12.44,100],
                                [100,100,100],
                                [10.8,12.44,100],
                                [10.8,12.44,100],
                                [100,100,100],
                                [10.8,12.44,100],
                                [10.8,12.44,100],
                                [100,100,100],
                                [10.8,12.44,100],
                                [10.8,12.44,100],
                                [100,100,100],
                                [10.8,12.44,100],
                                [10.8,12.44,100],
                                [100,100,100],
                                [10.8,12.44,100],
                                [10.8,12.44,100]]
    
    var spacing : CGFloat = 10
    var cellWidth : CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var maxVal = [Double]()
        barVals.forEach { (doubleArray) in
            maxVal.append(doubleArray.max() ?? 0)
        }
        
        stackedBarView.stackedBarVals = barVals
        stackedBarView.barCellWidth = 40
        stackedBarView.barCellSpacing = spacing
        stackedBarView.maxValue = maxVal.max()
    }
}
