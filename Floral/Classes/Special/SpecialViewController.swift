//
//  SpecialViewController.swift
//  Floral
//
//  Created by 武路明 on 2018/5/9.
//  Copyright © 2018年 dd. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class SpecialViewController: HTBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    fileprivate var dataCount = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setNav()
        
        addCollection()
    }
    
    func addCollection() {
        let layout = SpecialCollectionViewFlowLayout(lineSpacing: 5, columnSpacing: 5, sectionInsets: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5), fallHeightBlock: { () -> CGFloat in
            return CGFloat(100 + arc4random() % 30)
        }) { () -> Int in
            return 2
        }
       
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.register(SpecialFlowLayoutCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        
        
//        collectionView.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(0)
//            make.left.equalToSuperview().offset(0)
//            make.right.equalToSuperview().offset(0)
//            make.bottom.equalToSuperview().offset(0)
//        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SpecialFlowLayoutCell
        let width = String(Float(collectCell.imageview.frame.width))
        let height = String(Float(collectCell.imageview.frame.height))
//        DispatchQueue.global().async {
//
//            if let url = URL(string: "https://placebeard.it/\(width)/\(height)") {
//                let data = try! Data(contentsOf: url)
//                let image = UIImage(data: data)
//
//                DispatchQueue.main.async(execute: {
//                    collectCell.imageview.image = image
//                })
//            }
//
//        }
        if let url = URL(string: "https://placebeard.it/\(width)/\(height)") {
            collectCell.imageview.kf.setImage(with: url)
        }
        
        return collectCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCount
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath.row)
    }
    
    func setNav() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuBtn)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "签到", style: .done, target: self, action: #selector(SpecialViewController.signClick))
    }
    
    private lazy var menuBtn : UIButton = {
        let btn = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 30, height: 30)))
        btn.setImage(UIImage(named: "menu"), for: UIControlState.normal)
        btn.addTarget(self, action: #selector(SpecialViewController.menuClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    @objc func menuClick() {
        
    }
    
    @objc func signClick() {
        
    }
}
