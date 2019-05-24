//
//  ViewController.swift
//  Charts
//
//  Created by abhinav khanduja on 23/05/19.
//  Copyright © 2019 abhinav khanduja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var values : [CGFloat] = [2.8,12.44,33.5,4.5,9]
    
    var spacing : CGFloat = 10
    var cellWidth : CGFloat = 20

    @IBOutlet weak var barChartCollView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return values.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "barCell", for: indexPath) as! CollectionViewCell
        cell.roundCorners(corners: [.topLeft, .topRight], radius: cell.frame.width/2)
        cell.barViewHeight.constant = CGFloat(values[indexPath.row]) * (cell.frame.height/100)
        cell.layoutIfNeeded()
        cell.barView.roundCorners(corners: [.topLeft, .topRight], radius: cell.frame.width/2)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        let totalCellWidth = cellWidth * CGFloat(values.count)
        let totalSpacingWidth = spacing * (CGFloat(values.count) - 1)
        
        if totalCellWidth+totalSpacingWidth > collectionView.frame.width {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }

        let leftInset = (collectionView.frame.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset

        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = maskPath.cgPath
        layer.mask = shapeLayer
    }
}

