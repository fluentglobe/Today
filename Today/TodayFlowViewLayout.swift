//
//  TodayFlowViewLayout.swift
//  Today
//
//  Created by Henrik Vendelbo on 14/07/2015.
//  Copyright © 2015 Right Here Inc. All rights reserved.
//

import UIKit

class TodayFlowViewLayout: UICollectionViewFlowLayout {

    override func prepareLayout() {
        super.prepareLayout()
        scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        // exercise sizing
        let viewSize = collectionView!.bounds.size
        itemSize = CGSize(width: viewSize.width, height: viewSize.height)
        estimatedItemSize = itemSize
    }
}
