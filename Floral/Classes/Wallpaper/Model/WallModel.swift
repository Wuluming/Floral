//
//  WallModel.swift
//  Floral
//
//  Created by dd on 2018/5/14.
//  Copyright © 2018年 dd. All rights reserved.
//

import UIKit
import Alamofire

//typealias Response = (_ wallArray:Array<WallModel>?,_ failure: NSError?) -> Void
class WallModel {
    var wallID: String!
    var wallTitle: String!
    var wallBigImg: String!
    var wallSnapImg: String!
    
    init(_ wallID: String, _ wallTitle: String, _ wallBigImg: String, _ wallSnapImg: String) {
        self.wallID = wallID
        self.wallTitle = wallTitle
        self.wallBigImg = wallBigImg
        self.wallSnapImg = wallSnapImg
    }
    
}
/*
{
                            "groupId":"0",
                            "wallpaperViews":[
                                    {
                                            "id":"3f5514a5-e69d-4dcb-9b1b-3ef45d5f94d8",
                                            "title":"在自己的生命里起舞",
                                            "bigImg":"http://htxq.img-cn-beijing.aliyuncs.com/UploadFiles/2018/05/10/20180510102059788092_750_1334.jpg",
                                            "snapImg":"http://htxq.img-cn-beijing.aliyuncs.com/UploadFiles/2018/05/10/20180510102059788092_640_690.jpg@!page426"
                                    }
                            ]
                    }
*/
