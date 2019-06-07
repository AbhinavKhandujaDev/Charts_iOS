//
//  StackedBarChartView.swift
//  Charts
//
//  Created by abhinav khanduja on 07/06/19.
//  Copyright © 2019 abhinav khanduja. All rights reserved.
//

import UIKit

class StackedBarChartView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var stackedBarCollectionView: UICollectionView!

    var stackedBarVals : [[Double]] = []
    
    var colors : [CGColor] = []
    
    var barCellSpacing : CGFloat = 10.0
    
    var barCellWidth : CGFloat = 15.0
    
    var maxValue : Double!
    
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
        Bundle.main.loadNibNamed("StackedBarChart", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        stackedBarCollectionView.delegate = self
        stackedBarCollectionView.dataSource = self
        stackedBarCollectionView.register(UINib(nibName: "StackedBarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "stackedBarCell")
    }
    
}

extension StackedBarChartView : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stackedBarVals.count //barValues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stackedBarCell", for: indexPath) as! StackedBarCollectionViewCell
        
//        let bStack = StackStruct(barValue: CGFloat(stackedBarVals[indexPath.row][0]), maxValue: CGFloat(stackedBarVals[indexPath.row].max()!))
//        let mStack = StackStruct(barValue: CGFloat(stackedBarVals[indexPath.row][1]), maxValue: CGFloat(stackedBarVals[indexPath.row].max()!))
//        let tStack = StackStruct(barValue: CGFloat(stackedBarVals[indexPath.row][2]), maxValue: CGFloat(stackedBarVals[indexPath.row].max()!))
        
        let val1 : Double = (stackedBarVals[indexPath.row].indices.contains(0)) ? stackedBarVals[indexPath.row][0] : 0
        let val2 : Double = (stackedBarVals[indexPath.row].indices.contains(1)) ? stackedBarVals[indexPath.row][1] : 0
        let val3 : Double = (stackedBarVals[indexPath.row].indices.contains(2)) ? stackedBarVals[indexPath.row][2] : 0
        
        let bStack = StackStruct(barValue: CGFloat(val1), maxValue: CGFloat(maxValue))
        let mStack = StackStruct(barValue: CGFloat(val2), maxValue: CGFloat(maxValue))
        let tStack = StackStruct(barValue: CGFloat(val3), maxValue: CGFloat(maxValue))
        
        cell.setStacks(bottomStack: bStack, midStack: mStack, topStack: tStack)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: barCellWidth, height: stackedBarCollectionView.frame.height - 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return barCellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        collectionView.collectionViewLayout.invalidateLayout()
        
        let totalCellWidth = barCellWidth * CGFloat(stackedBarVals.count )
        let totalSpacingWidth = barCellSpacing * (CGFloat(stackedBarVals.count ) - 1)
        
        if totalCellWidth+totalSpacingWidth > collectionView.frame.width {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        let leftInset = (collectionView.frame.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
}
