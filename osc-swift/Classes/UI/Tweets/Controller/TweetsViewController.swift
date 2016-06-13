//
//  TweetsViewController.swift
//  osc-swift
//
//  Created by zhaoyuan on 16/5/30.
//  Copyright © 2016年 赵远. All rights reserved.
//

import UIKit
import DGElasticPullToRefresh


class TweetsViewController: UIViewController {
    
    private var tableView: UITableView!
    private var listData: Array<Tweets>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        initView()
        
    }
    
    func initData(){
        
        
        let url:String="http://www.oschina.net/action/api/tweet_list"
        listData = [Tweets]()
    


        
        VMXMLParser.initParserWithURLString(url, completionHandler: {
            (tags, error) -> Void in
            if(error != nil){
                print(error)
            }else{
                
                print(tags!)

                
                let dic:NSArray = tags!
                
                for data in dic {
                    let model = Tweets.objectWithKeyValues(data as! NSDictionary) as! Tweets  //as 转换类型
                    if model.imgSmall != nil{
                        self.listData.append(model)
                    }
                    
                    
                }
                
                
                
            }
        })

        
    }
    
    
    func initView(){
        
        self.title = "动弹"
        
        tableView = UITableView(frame: view.bounds, style: .Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 231/255.0, alpha: 1.0)
        tableView.backgroundColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 251/255.0, alpha: 1.0)
        view.addSubview(tableView)
        tableView.registerNib(TweetsTableViewCell.NibObject(), forCellReuseIdentifier: theme.cellIdentifier)
        
        
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor(red: 78/255.0, green: 221/255.0, blue: 200/255.0, alpha: 1.0)
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
                self?.tableView.dg_stopLoading()
            })
            }, loadingView: loadingView)
        tableView.dg_setPullToRefreshFillColor(UIColor(red: 57/255.0, green: 67/255.0, blue: 89/255.0, alpha: 1.0))
        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
        
        
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

extension TweetsViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(theme.cellIdentifier) as! TweetsTableViewCell
        cell.setCellContnet(self.listData[indexPath.row])
        return cell
    }
    
    
}

// MARK: -
// MARK: UITableView Delegate

extension TweetsViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let  vc = HomeDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath)  -> CGFloat{
        
        return 128;
        
    }
    
}

