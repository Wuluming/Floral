//
//  SpecialViewController.swift
//  Floral
//
//  Created by 武路明 on 2018/5/9.
//  Copyright © 2018年 dd. All rights reserved.
//

import UIKit

class SpecialViewController: HTBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setNav()
        
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
