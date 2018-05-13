//
//  SpecialCollectionViewFlowLayout.swift
//  Floral
//
//  Created by 武路明 on 2018/5/13.
//  Copyright © 2018年 dd. All rights reserved.
//

import UIKit
import Foundation

class SpecialCollectionViewFlowLayout: UICollectionViewLayout {
    
    fileprivate var lineSpacing: CGFloat!
    fileprivate var columnSpacing: CGFloat!
    fileprivate var sectionInsets: UIEdgeInsets = UIEdgeInsets.zero
    fileprivate var columnHeights = [Int:CGFloat]()
    fileprivate var attributes = [UICollectionViewLayoutAttributes]()
    fileprivate var heightBlock:(()->CGFloat)!
    fileprivate var columnCountBlock:(()->Int)!
    
    init(lineSpacing: CGFloat, columnSpacing: CGFloat, sectionInsets: UIEdgeInsets, fallHeightBlock:@escaping()->CGFloat, fallColumnCountBlock:@escaping ()-> Int) {
        super.init()
        self.lineSpacing = lineSpacing
        self.columnSpacing = columnSpacing
        self.sectionInsets = sectionInsets
        heightBlock = fallHeightBlock
        columnCountBlock = fallColumnCountBlock
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var collectionViewContentSize: CGSize {
        var maxHeight:CGFloat = 0
        for height in columnHeights.values {
            if height > maxHeight {
                maxHeight = height
            }
        }
        return CGSize(width: collectionView!.frame.width, height: maxHeight + sectionInsets.bottom)
    }
    
    override func prepare() {
        super.prepare()
        guard collectionView != nil else {
            return
        }
        
        let columnCount = columnCountBlock()
        for i in 0..<columnCount {
            columnHeights[i] = sectionInsets.top
        }
        
        let itemCount = collectionView!.numberOfItems(inSection: 0)
        attributes.removeAll()
        
        for i in 0..<itemCount {
            if let attr = layoutAttributesForItem(at: IndexPath(row: i, section: 0)){
                attributes.append(attr)
            }
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if let collectionView = collectionView {
            let layout = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            let width = collectionView.frame.width
            let columnCount = columnCountBlock()
            
            guard columnCount > 0 else {
                return nil
            }
            
            let totalwidth = (width - sectionInsets.left - sectionInsets.right - (CGFloat(columnCount - 1) * columnSpacing))
            let itemWidth = totalwidth / CGFloat(columnCount)
            
            let itemHeight = heightBlock()
            
            var minIndex = 0
            
            for column in columnHeights {
                if column.value < columnHeights[minIndex]! {
                    minIndex = column.key
                }
            }
            let itemX = sectionInsets.left + (columnSpacing + itemWidth) * CGFloat(minIndex)
            let itemY = (columnHeights[minIndex]!) + lineSpacing
            
            layout.frame = CGRect(x: itemX, y: itemY, width: itemWidth, height: itemHeight)
            
            columnHeights[minIndex]! = layout.frame.maxY
            return layout
        }
        return nil
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
         return attributes
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
