//
//  FindViewController.swift
//  osc-swift
//
//  Created by zhaoyuan on 16/6/4.
//  Copyright © 2016年 赵远. All rights reserved.
//

import UIKit

class FindViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "发现"
        tableview.dataSource = self
        tableview.delegate = self
        tableview.separatorColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 231/255.0, alpha: 1.0)
        tableview.backgroundColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 251/255.0, alpha: 1.0)
        tableview.registerNib(FindTableViewCell.NibObject(), forCellReuseIdentifier: theme.cellIdentifier)
        
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

extension FindViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if section == 0 {
            return 1
        }
        return 2
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(theme.cellIdentifier) as! FindTableViewCell
        
        switch indexPath.section {
        case 0:
            
            cell.icon.image = UIImage(named: "discover-events")
            cell.title.text = "好友圈";
        case 1:
            
            cell.icon.image = UIImage(named: ["discover-search", "discover-activities"][indexPath.row])
            cell.title.text =  ["找人", "活动"][indexPath.row];
        default :
            
            cell.icon.image = UIImage(named: ["discover-scan", "discover-shake"][indexPath.row])
            cell.title.text =  ["扫一扫", "摇一摇"][indexPath.row];
            
        }
        
        return cell
    }
    
}

// MARK: -
// MARK: UITableView Delegate

extension FindViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let  vc = HomeDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

