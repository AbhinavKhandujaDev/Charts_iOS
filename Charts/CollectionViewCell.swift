//
//  CollectionViewCell.swift
//  Charts
//
//  Created by abhinav khanduja on 23/05/19.
//  Copyright © 2019 abhinav khanduja. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var cellHeight : CGFloat!
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var barViewHeight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell(value:CGFloat, maxVal: CGFloat, colors: [CGColor]) {
        barViewHeight.constant = CGFloat(value) * (frame.height/maxVal)
        layoutIfNeeded()
        
        roundCorners(corners: [.topLeft, .topRight], radius: frame.width/2)
        barView.roundCorners(corners: [.topLeft, .topRight], radius: barView.frame.width/2)
        barView.setGradientColor(bounds: barView.bounds, colors: colors)
        valueLabel.text = "\(value)"
    }
}
