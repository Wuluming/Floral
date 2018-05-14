//
//  WallpaperViewController.swift
//  Floral
//
//  Created by 武路明 on 2018/5/9.
//  Copyright © 2018年 dd. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
import Alamofire
import SwiftyJSON
class WallpaperViewController: HTBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var dataList: Array<WallModel> = []
    fileprivate var dataCount = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "每日壁纸"
        view.backgroundColor = UIColor.white
        
        addCollection()
        
        loadData()
    }
    
    func loadData() {
        let path = Bundle.main.path(forResource: "wall", ofType: "json")
        let data = NSData.init(contentsOfFile: path!)
        
        let jsonDic:NSDictionary = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        let dataArr: NSArray = jsonDic["data"] as! NSArray
        
       
    }
    
    func addCollection() {
        let layout = SpecialCollectionViewFlowLayout(lineSpacing: 5, columnSpacing: 5, sectionInsets: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5), fallHeightBlock: { () -> CGFloat in
            return CGFloat(100 + arc4random() % 30)
        }) { () -> Int in
            return 2
        }
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.register(SpecialFlowLayoutCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        collectionView.register(SpecialReusableHeaderView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SpecialFlowLayoutCell
        let width = String(Float(collectCell.imageview.frame.width))
        let height = String(Float(collectCell.imageview.frame.height))
        
        if let url = URL(string: "https://placebeard.it/\(width)/\(height)") {
            collectCell.imageview.kf.setImage(with: url)
        }
        
        return collectCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let v = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
        return v
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: SCREEN_WIDTH, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCount
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath.row)
    }
}
