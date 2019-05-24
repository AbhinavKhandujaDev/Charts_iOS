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
    
    @IBOutlet weak var barViewHeight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
