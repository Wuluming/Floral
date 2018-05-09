//
//  NavBaseViewCotroller.swift
//  Floral
//
//  Created by 武路明 on 2018/5/9.
//  Copyright © 2018年 dd. All rights reserved.
//

import UIKit

class NavBaseViewCotroller: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 1 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action:#selector(NavBaseViewCotroller.back))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc func back() {
        super.popViewController(animated: true)
    }
}
