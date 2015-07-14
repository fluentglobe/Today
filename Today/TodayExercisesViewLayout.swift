//
//  TodayExercisesViewLayout.swift
//  Today
//
//  Created by Henrik Vendelbo on 04/07/2015.
//  Copyright © 2015 Right Here Inc. All rights reserved.
//

import UIKit

class TodayExercisesViewLayout: UICollectionViewLayout {
    
    // 4 exercises per day
    var exercisesTodayCount:Int = 4,
        center = CGPoint(x: 160, y: 240),
        exerSize = CGSize(width: 320, height: 480)
    
    var attributes = [UICollectionViewLayoutAttributes]()
    
    override func prepareLayout() {
        super.prepareLayout()
        
        // base on current data
        let dataSource = collectionView!.dataSource as! ExercisesDataSource
        exercisesTodayCount = dataSource.exercisesTodayCount()
        if exercisesTodayCount == 0 {
            return
        }
        
        // exercise sizing
        let viewSize = collectionView!.bounds.size
        self.center = CGPoint(x: viewSize.width/2, y: viewSize.height/2)
        exerSize = CGSize(width: viewSize.width, height: viewSize.height)

        // pre-calc attributes
        if exercisesTodayCount != attributes.count {
            prepareAttributes()
        }
    }
    
    override func invalidateLayout() {
        super.invalidateLayout()
        attributes = [UICollectionViewLayoutAttributes]()
    }
    
    override func collectionViewContentSize() -> CGSize {
        let width:CGFloat = collectionView!.bounds.size.width * CGFloat(exercisesTodayCount)
        let height:CGFloat = collectionView!.bounds.size.height
        let contentSize = CGSizeMake(width, height)
        return contentSize
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attrsInRect = NSMutableArray()
        for attributes in self.attributes {
            if CGRectIntersectsRect(rect, attributes.frame) {
//                var attr = attributes as! ExercisesViewLayoutAttributes
                //                println("layout for \(attributes.description), \(attr.foreground)")
                attrsInRect.addObject(attributes)
            }
        }
        return attrsInRect as NSArray as? [UICollectionViewLayoutAttributes]
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        if indexPath.section > 1 {
            return nil //TODO multisection support
        }
        if indexPath.item >= exercisesTodayCount {
            return nil
        }
        return attributes[indexPath.item]
    }
    
    func prepareAttributes() {
        var forAll = [UICollectionViewLayoutAttributes](),
            startCenterX = center.x,
            centerX = CGFloat(startCenterX),
            incWidth = collectionView!.bounds.size.width
        
        for index in 0 ..< self.exercisesTodayCount {
            let path = NSIndexPath(forItem: index, inSection: 0)
            
            let attrs = ExercisesViewLayoutAttributes(forCellWithIndexPath: path)
            attrs.center = CGPointMake(centerX, self.center.y)
            attrs.size = CGSize(width: exerSize.width, height: exerSize.height)
            
            centerX += incWidth

            
            forAll.append(attrs)
        }
        
        attributes = forAll
    }

}
