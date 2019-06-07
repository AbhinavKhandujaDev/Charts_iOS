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
    
    var barVals : [[Double]] = [[100,100,100],
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
        stackedBarView.stackedBarVals = barVals
        stackedBarView.barCellWidth = 40
        stackedBarView.barCellSpacing = spacing
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
