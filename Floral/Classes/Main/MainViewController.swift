//
//  MainViewController.swift
//  Floral
//
//  Created by 武路明 on 2018/5/8.
//  Copyright © 2018年 dd. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setUI()
    }
    
    func setUI() {
        addViewController(childController: SpecialViewController(), title: "专题")
        addViewController(childController: WallpaperViewController(), title: "壁纸")
        addViewController(childController: MeViewController(), title: "我的")
    }
    
    private func addViewController(childController: UIViewController ,title: String) {
        let nav = NavBaseViewCotroller(rootViewController: childController)
        addChildViewController(nav)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(named: "tb_\(childViewControllers.count-1)")
        nav.tabBarItem.selectedImage = UIImage(named: "tb_\(childViewControllers.count-1)"+"_selected")
        
    }
}
