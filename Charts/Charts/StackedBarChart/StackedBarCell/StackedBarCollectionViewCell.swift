//
//  StackedBarCollectionViewCell.swift
//  Charts
//
//  Created by abhinav khanduja on 07/06/19.
//  Copyright © 2019 abhinav khanduja. All rights reserved.
//

import UIKit

class StackedBarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var bottomBarView: UIView!
    @IBOutlet weak var bottomBarHeight: NSLayoutConstraint!
    @IBOutlet weak var bottomValueLabel: UILabel!
    
    @IBOutlet weak var midBarView: UIView!
    @IBOutlet weak var midBarHeight: NSLayoutConstraint!
    @IBOutlet weak var midValueLabel: UILabel!
    
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var topBarHeight: NSLayoutConstraint!
    @IBOutlet weak var topValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setStacks(bottomStack : StackStruct, midStack : StackStruct, topStack : StackStruct) {
        if bottomStack.barValue != nil && bottomStack.maxValue != nil {
            bottomBarHeight.constant = (CGFloat(bottomStack.barValue!) * (frame.height/bottomStack.maxValue!))/3
            bottomValueLabel.text = "\(bottomStack.barValue ?? 0)"
        }
        
        if midStack.barValue != nil && midStack.maxValue != nil {
            midBarHeight.constant = (CGFloat(midStack.barValue!) * (frame.height/midStack.maxValue!))/3
            midValueLabel.text = "\(midStack.barValue ?? 0)"
        }
        
        if topStack.barValue != nil && topStack.maxValue != nil {
            topBarHeight.constant = (CGFloat(topStack.barValue!) * (frame.height/topStack.maxValue!))/3
            topValueLabel.text = "\(topStack.barValue ?? 0)"
        }
    }
}
struct StackStruct {
    let barValue : CGFloat?
    let maxValue : CGFloat?
}
