//
//  MainViewController.swift
//  osc-swift
//
//  Created by zhaoyuan on 16/5/30.
//  Copyright © 2016年 赵远. All rights reserved.
//

import UIKit



class MainViewController: UITabBarController {
    
    
    private var centerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.creatSubViewControllers()
        self.addCenterButtonWithImage()
        

    }
    
    
    private  func addCenterButtonWithImage(){
        
        centerButton = UIButton(type:.Custom)
        
        let origin = self.view.convertPoint(self.tabBar.center, toView: self.tabBar)
        
        let buttonSize  = CGSizeMake(self.tabBar.frame.size.width / 5 - 6, self.tabBar.frame.size.height - 4);
        
        centerButton.frame = CGRectMake(origin.x - buttonSize.height/2, origin.y - buttonSize.height/2, buttonSize.height, buttonSize.height);
        
        centerButton.setImage(UIImage(named: "tabbar-more"), forState: UIControlState.Normal)
        centerButton.setImage(UIImage(named: "tabbar-more"), forState: UIControlState.Selected)

        
        centerButton.backgroundColor = theme.NavigationBarBg
        
        centerButton.layer.cornerRadius = buttonSize.height/2
        
        self.tabBar.addSubview(centerButton)

        
        

        
        
    }
    
    
    private  func creatSubViewControllers(){
    
        tabBaraAddChildViewController(vc: HomeViewController (), title: "综合", imageName: "tabbar-news", selectedImageName: "tabbar-news-selected")
        
        tabBaraAddChildViewController(vc: TweetsViewController (), title: "动弹", imageName: "tabbar-tweet", selectedImageName: "tabbar-tweet-selected")
        
        tabBaraAddChildViewController(vc: ViewController (), title: "动弹", imageName: "tabbar-tweet", selectedImageName: "tabbar-tweet-selected")
        
        tabBaraAddChildViewController(vc: FindViewController (), title: "发现", imageName: "tabbar-discover", selectedImageName: "tabbar-discover-selected")
        tabBaraAddChildViewController(vc: MineViewController (), title: "我", imageName: "tabbar-me", selectedImageName: "tabbar-me-selected")
        
    }
    
    
    private func tabBaraAddChildViewController(vc vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
        vc.view.backgroundColor = theme.SDBackgroundColor
        vc.tabBarItem!.setTitleTextAttributes([NSForegroundColorAttributeName: theme.NavigationBarBg], forState: .Selected)
        
        if vc .isKindOfClass(ViewController) {
            
            vc.tabBarItem.enabled = false
        }else{

  
            
        }
        
        let nav = NavigationController(rootViewController: vc)
        addChildViewController(nav)
        
       
        
        
        
            
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}

