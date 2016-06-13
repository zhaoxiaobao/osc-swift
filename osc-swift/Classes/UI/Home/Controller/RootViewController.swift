//
//  RootViewController.swift
//  osc-swift
//
//  Created by zhaoyuan on 16/6/1.
//  Copyright © 2016年 赵远. All rights reserved.
//

import UIKit



class RootViewController: UIViewController {
    
    
    var leftButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        leftButton = UIButton(frame: CGRectMake(0, 20, 80, 44))
//        leftButton.setImage(UIImage(named: "navigationbar-sidebar"), forState: .Normal)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "navigationbar-sidebar"), style: .Plain, target: self, action:#selector(RootViewController.pushView))
        
         navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "navigationbar-search"), style: .Plain, target: self, action:#selector(RootViewController.pushView))
        
        

        // Do any additional setup after loading the view.
    }
    
    
    func pushView() {
      print("点击菜单了")

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
