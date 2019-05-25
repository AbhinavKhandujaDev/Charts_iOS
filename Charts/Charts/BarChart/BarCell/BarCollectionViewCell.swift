//
//  BarCollectionViewCell.swift
//  Charts
//
//  Created by abhinav khanduja on 25/05/19.
//  Copyright © 2019 abhinav khanduja. All rights reserved.
//

import UIKit

class BarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pathBarView: UIView!
    @IBOutlet weak var valueBarView: UIView!
    @IBOutlet weak var valueBarHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(value:CGFloat, maxVal: CGFloat, colors: [CGColor]) {
        valueBarHeightConstraint.constant = CGFloat(value) * (frame.height/maxVal)
        layoutIfNeeded()
        
        roundCorners(corners: [.topLeft, .topRight], radius: frame.width/2)
        valueBarView.roundCorners(corners: [.topLeft, .topRight], radius: valueBarView.frame.width/2)
        valueBarView.setGradientColor(bounds: valueBarView.bounds, colors: colors)
        valueLabel.text = "\(value)"
    }

}
