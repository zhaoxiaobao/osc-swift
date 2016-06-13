//
//  HomeViewController.swift
//  osc-swift
//
//  Created by zhaoyuan on 16/5/30.
//  Copyright © 2016年 赵远. All rights reserved.
//

import UIKit
import DGElasticPullToRefresh
import Alamofire
import SwiftyJSON

class HomeViewController: RootViewController {

    private var tableView: UITableView!
    private var newsData: Array<NewsModel>!

    // MARK: -
    override func loadView() {
        super.loadView()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            self.initData()

            dispatch_async(dispatch_get_main_queue(), {
                
            })
        })
        
        setNav()
        
        initView()
        
        
    }
    
    
    //请求获取新闻数据
    func initData(){
        
        let url:String="http://www.oschina.net/action/api/news_list"
        newsData = [NewsModel]()
        VMXMLParser.initParserWithURLString(url, completionHandler: {
            (tags, error) -> Void in
            if(error != nil){
                print(error)
            }else{
                
                let dic:NSArray = tags!
                
                for data in dic {
                    let model = NewsModel.objectWithKeyValues(data as! NSDictionary) as! NewsModel  //as 转换类型                    
                    if model.author != nil{
                        self.newsData.append(model)
                    }
                }
                
                
                self.tableView.reloadData()

                
                
                
            }
        })
        
    }
    
    func setNav() {
        self.title = "综合"
    }
    
    
    func initView() {
        
        tableView = UITableView(frame: view.bounds, style: .Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 231/255.0, alpha: 1.0)
        tableView.backgroundColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 251/255.0, alpha: 1.0)
        view.addSubview(tableView)
        tableView.registerNib(NewsTableViewCell.NibObject(), forCellReuseIdentifier: theme.cellIdentifier)
            
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    
    deinit {
        tableView.dg_removePullToRefresh()
    }
    
}

// MARK: -
// MARK: UITableView Data Source

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(theme.cellIdentifier) as! NewsTableViewCell
        cell.setCellContnet(self.newsData[indexPath.row])
        return cell
    }
    
}

// MARK: -
// MARK: UITableView Delegate

extension HomeViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let  vc = HomeDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath)  -> CGFloat{
        
        return 128;
        
    }
    
}
