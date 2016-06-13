//
//  theme.swift
//  osc-swift
//
//  Created by zhaoyuan on 16/5/31.
//  Copyright © 2016年 赵远. All rights reserved.
//

import Foundation
import UIKit

public let NavigationH: CGFloat = 64
public let AppWidth: CGFloat = UIScreen.mainScreen().bounds.size.width
public let AppHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
public let MainBounds: CGRect = UIScreen.mainScreen().bounds

struct theme {
    ///  APP导航条barButtonItem文字大小
    static let SDNavItemFont: UIFont = UIFont.systemFontOfSize(16)
    ///  APP导航条titleFont文字大小
    static let SDNavTitleFont: UIFont = UIFont.systemFontOfSize(18)
    /// 设置控制器背景颜色
    static let SDBackgroundColor: UIColor = UIColor.colorWith(255, green: 255, blue: 255, alpha: 1)
    
    /// 设置导航栏背景颜色
    static let NavigationBarBg: UIColor = UIColor.colorWith(61, green: 174, blue: 85, alpha: 1)

    /// 设置导航栏背景颜色
    static let NavigationBarTitleColor: UIColor = UIColor.whiteColor()
    
    
    static let cellIdentifier:String = "cellIdentifier"


}


extension NSObject{
    
    class func objectWithKeyValues(keyValues:NSDictionary) -> AnyObject{
        let model = self.init()
        //存放属性的个数
        var outCount:UInt32 = 0
        //获取所有的属性
        let properties = class_copyPropertyList(self.classForCoder(), &outCount)
        //遍历属性
        for i in 0 ..< Int(outCount) {
            //获取第i个属性
            let property = properties[i]
            //得到属性的名字
            let key = NSString(CString: property_getName(property), encoding: NSUTF8StringEncoding)!
            if let value = keyValues[key]{
                //为model类赋值
                model.setValue(value, forKey: key as String)
            }
        }
        return model
    }
}


// 拓展
extension UIColor {
    class func colorWith(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        let color = UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
        return color
    }
    
}

/// 对UIView的扩展
extension UIView {
    /// X值
    var x: CGFloat {
        return self.frame.origin.x
    }
    /// Y值
    var y: CGFloat {
        return self.frame.origin.y
    }
    /// 宽度
    var width: CGFloat {
        return self.frame.size.width
    }
    ///高度
    var height: CGFloat {
        return self.frame.size.height
    }
    var size: CGSize {
        return self.frame.size
    }
    var point: CGPoint {
        return self.frame.origin
    }
}



extension UIView {
    /**
     主要用于获取 Cell 的 Nib 对象，用于 registerNib
     */
    class func NibObject() -> UINib {
        let hasNib: Bool = NSBundle.mainBundle().pathForResource(self.nameOfClass, ofType: "nib") != nil
        guard hasNib else {
            assert(!hasNib, "Invalid parameter") // assert
            return UINib()
        }
        return UINib(nibName: self.nameOfClass, bundle:nil)
    }
    
    
    class func fromNib<T : UIView>(nibNameOrNil: String? = nil) -> T {
        let v: T? = fromNib(nibNameOrNil)
        return v!
    }
    
    class func fromNib<T : UIView>(nibNameOrNil: String? = nil) -> T? {
        var view: T?
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            // Most nibs are demangled by practice, if not, just declare string explicitly
            name = "\(T.self)".componentsSeparatedByString(".").last!
        }
        let nibViews = NSBundle.mainBundle().loadNibNamed(name, owner: nil, options: nil)
        for v in nibViews {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }
}


extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).componentsSeparatedByString(".").last! as String
    }
    
    //用于获取 cell 的 reuse identifier
    class var identifier: String {
        return String(format: "%@_identifier", self.nameOfClass)
    }
}



