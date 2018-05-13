//
//  SpecialFlowLayoutCell.swift
//  Floral
//
//  Created by 武路明 on 2018/5/13.
//  Copyright © 2018年 dd. All rights reserved.
//

import UIKit

class SpecialFlowLayoutCell: UICollectionViewCell {

    var imageview:UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        self.contentView.addSubview(imageview)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
