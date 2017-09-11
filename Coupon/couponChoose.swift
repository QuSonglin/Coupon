//
//  couponChoose.swift
//  Coupon
//
//  Created by yaowenqing on 2017/7/25.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit

class couponChoose:UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(couponChoose.backToMine))
        self.navigationItem.leftBarButtonItem = leftBarBtn
        leftBarBtn.tintColor = UIColor.white
        
        let couponUsing=myCoupon()
        let couponOn=myCoupon2()
        let couponDown=myCoupon3()
        
        let using=UINavigationController(rootViewController:couponUsing)
        using.tabBarItem=UITabBarItem(title:"未使用的优惠券",image:UIImage(named:"b.png"),selectedImage:UIImage(named:"b.png"))
        
        
        let on=UINavigationController(rootViewController:couponOn)
        on.tabBarItem=UITabBarItem(title:"已上架的优惠券",image:UIImage(named:"c.png"),selectedImage:UIImage(named:"c.png"))
        
        let down=UINavigationController(rootViewController:couponDown)
        down.tabBarItem=UITabBarItem(title:"未上架的优惠券",image:UIImage(named:"c.png"),selectedImage:UIImage(named:"b.png"))
        
        self.tabBar.barTintColor=UIColor(red:242/255,green:80/255,blue:56/255,alpha:1)
        self.tabBar.frame=CGRect(x:0,y:60,width:self.view.bounds.width,height:40)
        self.viewControllers=[using,on,down]
        self.selectedIndex=0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func backToMine(){
        self.navigationController?.popViewController(animated: true)
    }

   
}

