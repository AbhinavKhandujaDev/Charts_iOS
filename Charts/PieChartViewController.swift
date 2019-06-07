//
//  PieChartViewController.swift
//  Charts
//
//  Created by abhinav khanduja on 26/05/19.
//  Copyright © 2019 abhinav khanduja. All rights reserved.
//

import UIKit

class PieChartViewController: UIViewController {
    
//    @IBOutlet weak var drawView: DrawView!
    
    @IBOutlet weak var pieChartView: PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        self.drawView.setNeedsDisplay()
    }
    
}
