//
//  BarChartView.swift
//  Charts
//
//  Created by abhinav khanduja on 25/05/19.
//  Copyright © 2019 abhinav khanduja. All rights reserved.
//

import UIKit

class BarChartView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var barCollectionView: UICollectionView!
    
    var barValues : [Double] = []
    
    var colors : [CGColor] = []
    
    var barCellSpacing : CGFloat = 10.0
    
    var barCellWidth : CGFloat = 15.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setView() {
        Bundle.main.loadNibNamed("BarChart", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        barCollectionView.delegate = self
        barCollectionView.dataSource = self
        barCollectionView.register(UINib(nibName: "BarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "barCell")
    }
    
}

extension BarChartView : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return barValues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "barCell", for: indexPath) as! BarCollectionViewCell
        
        let val = barValues[indexPath.row]
        
        cell.setCell(value: CGFloat(val), maxVal: CGFloat(barValues.max() ?? 1), colors: colors)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: barCellWidth, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return barCellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let totalCellWidth = barCellWidth * CGFloat(barValues.count)
        let totalSpacingWidth = barCellSpacing * (CGFloat(barValues.count) - 1)
        
        if totalCellWidth+totalSpacingWidth > collectionView.frame.width {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        let leftInset = (collectionView.frame.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    
}
