//
//  MineViewController.swift
//  osc-swift
//
//  Created by zhaoyuan on 16/6/4.
//  Copyright © 2016年 赵远. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var headerView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我"


        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(FindTableViewCell.NibObject(), forCellReuseIdentifier: theme.cellIdentifier)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

// MARK: UITableView Data Source

extension MineViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    
        return 4
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(theme.cellIdentifier) as! FindTableViewCell
        cell.icon.image = UIImage(named: ["me-message","me-blog", "me-team", "me-message", ][indexPath.row])
        cell.title.text =  ["消息", "博客", "团队", "反馈"][indexPath.row];
        return cell
    }
    
}

// MARK: -
// MARK: UITableView Delegate

extension MineViewController: UITableViewDelegate {

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let  vc = HomeDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

