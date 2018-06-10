//
//  ResearchViewController.swift
//  Floral
//
//  Created by 武路明 on 2018/6/10.
//  Copyright © 2018年 dd. All rights reserved.
//

import UIKit
class ResearchViewController: HTBaseViewController {
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        loadData()
    }
    
    func setUI() {
        tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func loadData() {
        let path = Bundle.main.path(forResource: "research", ofType: "json")
        
        
    }
}

extension ResearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "限时免费"
        }
        return "最新内容"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        }
        return cell!
    }
}
