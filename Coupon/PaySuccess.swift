//
//  PaySuccess.swift
//  Coupon
//
//  Created by macbook on 17/7/14.
//  Copyright © 2017年 iss. All rights reserved.
//
import Foundation
import UIKit

class PaySuccess: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //设置导航栏
        self.title = "购买成功"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        //用户头像
        //let SellerImage = UIImage.
        
        //返回button
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(PaySuccess.backToDetails))
        self.navigationItem.leftBarButtonItem = leftBarBtn
        //self.navigationItem.backBarButtonItem = leftBarBtn
        //leftBarBtn.image = UIImage.
        leftBarBtn.tintColor = UIColor.white
        
        
        
        //创建图片视图
        let imageView = UIImageView(image:UIImage(named:"success"))
        imageView.frame = CGRect(x:60, y:120, width:60, height:60)
        self.view.addSubview(imageView)

        
        
        
        let info = UILabel(frame: CGRect(x: 160, y: 132, width: 200, height: 30))
        info.textColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        info.text = "恭喜您，支付成功"
        info.font = UIFont.systemFont(ofSize: 24)
        self.view.addSubview(info)
        
        
        
        
        let backBtn = UIButton(type: .system)
        
        backBtn.addTarget(self, action: #selector(PaySuccess.backToWelcome), for: .touchUpInside)
        
        backBtn.frame = CGRect(x:60, y:220, width:300, height:40)
        backBtn.setTitle("回到首页", for: UIControlState())
        backBtn.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        backBtn.setTitleColor(UIColor.white,for: UIControlState()) //普通状态下文字的颜色
        backBtn.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        backBtn.layer.cornerRadius = 10
        self.view.addSubview(backBtn)
        
        
        
    }
    
    //返回button action
    func backToDetails(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func backToWelcome(){
        let VC = Welcome()
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
