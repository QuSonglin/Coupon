//
//  couponDetail.swift
//  Coupon
//
//  Created by 屠明暄 on 2017/8/6.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit

class couponDetail: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(couponDetail.backToMessageList))
        self.navigationItem.leftBarButtonItem = leftBarBtn
        leftBarBtn.tintColor = UIColor.white
        
        self.title = "优惠券详情"
        
        let view1 = UIView(frame: CGRect(x: 0,y: 0,width: self.view.bounds.width ,height: self.view.bounds.height))
        view1.backgroundColor = UIColor(red:219/255,green:219/255,blue:219/255,alpha:1)
        view.addSubview(view1)
        
        let timeBg=UIView(frame:CGRect(x:(UIScreen.main.bounds.width)/2-90,y:70,width:180,height:20))
        timeBg.backgroundColor=UIColor.lightGray
        timeBg.layer.borderWidth=1
        timeBg.layer.cornerRadius=16
        view.addSubview(timeBg)
        
        let theTime=UILabel(frame:CGRect(x:(UIScreen.main.bounds.width)/2-70,y:71,width:140,height:18))
        theTime.textColor=UIColor.black
        theTime.text="2017/08/08"
        theTime.font = UIFont.systemFont(ofSize: 18)
        self.view.addSubview(theTime)
        
        let view2 = UIView(frame: CGRect(x: 20,y: 100,width: self.view.bounds.width-40,height:200))
        view2.backgroundColor = UIColor.white
        view.addSubview(view2)
        
        let imageView = UIImageView(frame: CGRect(x:30, y:140, width:120 , height: 120))
        imageView.image = UIImage(named:"caotuanzi.jpg")
        self.view.addSubview(imageView)
        
        let content=UILabel(frame:CGRect(x:25,y:103,width:300,height:35))
        content.textColor=UIColor.black
        content.text="上架的优惠券被购买"
        content.font=UIFont.systemFont(ofSize: 22)
        self.view.addSubview(content)
        
        let couponName=UILabel(frame:CGRect(x:(UIScreen.main.bounds.width)/2-40,y:150,width:300,height:35))
        couponName.textColor=UIColor.red
        couponName.text="冰封王座的骑士"
        couponName.font=UIFont.systemFont(ofSize: 30)
        self.view.addSubview(couponName)

        let couponPrice=UILabel(frame:CGRect(x:(UIScreen.main.bounds.width)/2-40,y:200,width:300,height:35))
        couponPrice.textColor=UIColor.darkGray
        couponPrice.text="$"+"20"
        couponPrice.font=UIFont.systemFont(ofSize: 32)
        self.view.addSubview(couponPrice)
        
        
        
    }
    
    func backToMessageList(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
