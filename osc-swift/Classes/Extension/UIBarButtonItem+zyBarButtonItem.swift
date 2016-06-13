//
//  UIBarButtonItem+zyBarButtonItem.swift
//  osc-swift
//
//  Created by zhaoyuan on 16/6/1.
//  Copyright © 2016年 赵远. All rights reserved.
//

import UIKit

public typealias ActionHandler = (Void) -> Void


public extension UINavigationItem {
    //left bar
    func leftButtonAction(image: UIImage, action:ActionHandler) {
        let button: UIButton = UIButton(type: UIButtonType.Custom)
        button.setImage(image, forState: .Normal)
        button.frame = CGRectMake(0, 0, 40, 30)
        button.imageView!.contentMode = .ScaleAspectFit;
        button.contentHorizontalAlignment = .Left
        button.ngl_addAction(forControlEvents: .TouchUpInside, withCallback: {
            action()
        })
        let barButton = UIBarButtonItem(customView: button)
        let gapItem = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        gapItem.width = -7 //fix the space
        self.leftBarButtonItems = [gapItem, barButton]
    }
    
    //right bar
    func rightButtonAction(image: UIImage, action:ActionHandler) {
        let button: UIButton = UIButton(type: UIButtonType.Custom)
        button.setImage(image, forState: .Normal)
        button.frame = CGRectMake(0, 0, 40, 30)
        button.imageView!.contentMode = .ScaleAspectFit;
        button.contentHorizontalAlignment = .Right
        button.ngl_addAction(forControlEvents: .TouchUpInside, withCallback: {
            action()
        })
        let barButton = UIBarButtonItem(customView: button)
        let gapItem = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        gapItem.width = -7 //fix the space
        self.rightBarButtonItems = [gapItem, barButton]
    }
}

public class ClosureWrapper : NSObject {
    let _callback : Void -> Void
    init(callback : Void -> Void) {
        _callback = callback
    }
    
    public func invoke() {
        _callback()
    }
}

var AssociatedClosure: UInt8 = 0

extension UIControl {
    private func ngl_addAction(forControlEvents events: UIControlEvents, withCallback callback: Void -> Void) {
        let wrapper = ClosureWrapper(callback: callback)
        addTarget(wrapper, action:#selector(ClosureWrapper.invoke), forControlEvents: events)
        objc_setAssociatedObject(self, &AssociatedClosure, wrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}


extension UIBarButtonItem {
    /// 导航条纯文字按钮
    convenience init(title: String, titleClocr: UIColor, targer: AnyObject ,action: Selector) {
        
        let button = UIButton(type: .Custom)
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(titleClocr, forState: .Normal)
        button.titleLabel?.font = theme.SDNavItemFont
        button.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
        button.frame = CGRectMake(0, 0, 80, 44)
        button.titleLabel?.textAlignment = NSTextAlignment.Right
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5)
        button.addTarget(targer, action: action, forControlEvents: .TouchUpInside)
        
        self.init(customView: button)
    }
}


