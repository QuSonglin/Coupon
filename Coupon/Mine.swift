//
//  Mine.swift
//  Coupon
//
//  Created by macbook on 17/7/17.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit

class Mine: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //导航栏

        //let messageView = UIImageView(frame: CGRect(x:150,y:20,width:30, height: 30))
        //messageView.image=UIImage(named:"message.png")
        //self.navigationItem.titleView=messageView
        //self.view.addSubview(messageView)
        
        //设置导航栏
       
        //self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //self.navigationController?.navigationBar.shadowImage = UIImage()
        //self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.isNavigationBarHidden=true
        
        let view1 = UIView(frame: CGRect(x: 0,y: 0,width: self.view.bounds.width ,height: 200))
        view1.backgroundColor = UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1)
        view.addSubview(view1)
    
        //用户头像
        let imageView = UIImageView(frame: CGRect(x:30, y:40, width:120 , height: 120))
        imageView.image = UIImage(named:"caotuanzi.jpg")
        imageView.contentMode = .scaleAspectFill
        //设置遮罩
        imageView.layer.masksToBounds=true
        //设置圆角半径（宽度的一半），显示成圆形。
        imageView.layer.cornerRadius=imageView.frame.width/2
        self.view.addSubview(imageView)
        
        //用户名称
        let userName = UITextField(frame: CGRect(x: 180, y: 40, width: 200, height: 60))
        userName.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        userName.text = "用户名"
        userName.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(userName)

        //1 我的钱包
        let myWalletBtn = UIButton(type: .system)
        myWalletBtn.addTarget(self, action: #selector(Mine.gotoMyWallet), for: .touchUpInside)
        myWalletBtn .frame = CGRect(x:0, y: 201, width: self.view.bounds.width, height:43)
        myWalletBtn .backgroundColor = UIColor.white
        self.view.addSubview(myWalletBtn)

        let myWalletView = UIImageView(frame: CGRect(x:20, y:210, width:30 , height: 30))
        myWalletView.image = UIImage(named:"mine1.png")
        self.view.addSubview(myWalletView)
        
        let myWallet = UILabel(frame: CGRect(x: 60, y: 210, width: 200, height: 30))
        myWallet.textColor = UIColor.black
        myWallet.text = "我的钱包"
        myWallet.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(myWallet)
        
        let line1 = UIView(frame: CGRect(x: 20,y: 245,width: self.view.bounds.width - 40 ,height: 1))
        line1.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        view.addSubview(line1)
    
        
        //2 我的优惠券
        let myCouponBtn = UIButton(type: .system)
        myCouponBtn.addTarget(self, action: #selector(Mine.gotoMyCoupon),for: .touchUpInside)
        myCouponBtn .frame = CGRect(x:0, y: 246, width: self.view.bounds.width, height:43)
        myCouponBtn .backgroundColor = UIColor.white
        self.view.addSubview(myCouponBtn)

        let myCouponView = UIImageView(frame: CGRect(x:20, y:255, width:30 , height: 30))
        myCouponView.image = UIImage(named:"mine2.png")
        self.view.addSubview(myCouponView)
        
        let myCoupon = UILabel(frame: CGRect(x: 60, y: 255, width: 200, height: 30))
        myCoupon.textColor = UIColor.black
        myCoupon.text = "我的优惠券"
        myCoupon.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(myCoupon)
        
        let line2 = UIView(frame: CGRect(x: 20,y: 290,width: self.view.bounds.width - 40 ,height: 1))
        line2.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        view.addSubview(line2)

        //3 我卖出的
        let haveSoldBtn = UIButton(type: .system)
        haveSoldBtn.addTarget(self, action: #selector(Mine.gotoHaveSold), for: .touchUpInside)
        haveSoldBtn.frame = CGRect(x:0, y: 291, width: self.view.bounds.width, height:43)
        haveSoldBtn.backgroundColor = UIColor.white
        self.view.addSubview(haveSoldBtn)
    
        let haveSoldView = UIImageView(frame: CGRect(x:20, y:300, width:30 , height: 30))
        haveSoldView.image = UIImage(named:"mine3.png")
        self.view.addSubview(haveSoldView)
        
        let haveSold = UILabel(frame: CGRect(x: 60, y: 300, width: 200, height: 30))
        haveSold.textColor = UIColor.black
        haveSold.text = "我卖出的"
        haveSold.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(haveSold)
    
        let line3 = UIView(frame: CGRect(x: 20,y: 335,width: self.view.bounds.width - 40 ,height: 1))
        line3.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        view.addSubview(line3)
        
        //4 我买到的
        let haveBoughtBtn = UIButton(type: .system)
        haveBoughtBtn.addTarget(self, action: #selector(Mine.gotoHaveBought), for: .touchUpInside)
        haveBoughtBtn .frame = CGRect(x:0, y: 336, width: self.view.bounds.width, height:43)
        haveBoughtBtn .backgroundColor = UIColor.white
        self.view.addSubview(haveBoughtBtn)
    
        let haveBoughtView = UIImageView(frame: CGRect(x:20, y:345, width:30 , height: 30))
        haveBoughtView.image = UIImage(named:"mine4.png")
        self.view.addSubview(haveBoughtView)
        
        let haveBought = UILabel(frame: CGRect(x: 60, y: 345, width: 200, height: 30))
        haveBought.textColor = UIColor.black
        haveBought.text = "我买到的"
        haveBought.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(haveBought)
        
        let line4 = UIView(frame: CGRect(x: 20,y: 380,width: self.view.bounds.width - 40 ,height: 1))
        line4.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        view.addSubview(line4)
        
        //5 我关注的
        let myFocusBtn = UIButton(type: .system)
        myFocusBtn.addTarget(self, action: #selector(Mine.gotoMyFocus), for: .touchUpInside)
        myFocusBtn.frame = CGRect(x:0, y: 381, width: self.view.bounds.width, height:43)
        myFocusBtn.backgroundColor = UIColor.white
        self.view.addSubview(myFocusBtn)
        
        let myFocusView = UIImageView(frame: CGRect(x:20, y:390, width:30 , height: 30))
        myFocusView.image = UIImage(named:"mine5.png")
        self.view.addSubview(myFocusView)

        let myFocus = UILabel(frame: CGRect(x: 60, y: 390, width: 200, height: 30))
        myFocus.textColor = UIColor.black
        myFocus.text = "我关注的"
        myFocus.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(myFocus)
        
        let line5 = UIView(frame: CGRect(x: 0,y: 425,width: self.view.bounds.width ,height: 15))
        line5.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        view.addSubview(line5)
        
        //6 设置
        let settingsBtn = UIButton(type: .system)
        settingsBtn.addTarget(self, action: #selector(Mine.gotoSettings), for: .touchUpInside)
        settingsBtn.frame = CGRect(x:0, y: 441, width: self.view.bounds.width, height:43)
        settingsBtn.backgroundColor = UIColor.white
        self.view.addSubview(settingsBtn)
        
        let settingsView = UIImageView(frame: CGRect(x:20, y:450, width:30 , height: 30))
        settingsView.image = UIImage(named:"mine6.png")
        self.view.addSubview(settingsView)
        
        let settings = UILabel(frame: CGRect(x: 60, y: 450, width: 200, height: 30))
        settings.textColor = UIColor.black
        settings.text = "设置"
        settings.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(settings)
        
        let line6 = UIView(frame: CGRect(x: 20,y: 485,width: self.view.bounds.width - 40 ,height: 1))
        line6.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        view.addSubview(line6)
        
        //7 帮助与反馈
        let helpInfoBtn = UIButton(type: .system)
        helpInfoBtn.addTarget(self, action: #selector(Mine.gotoHelpInfo), for: .touchUpInside)
        helpInfoBtn .frame = CGRect(x:0, y: 486, width: self.view.bounds.width, height:43)
        helpInfoBtn .backgroundColor = UIColor.white
        self.view.addSubview(helpInfoBtn)
        
        let helpInfoView = UIImageView(frame: CGRect(x:20, y:495, width:30 , height: 30))
        helpInfoView.image = UIImage(named:"mine7.png")
        self.view.addSubview(helpInfoView)
        
        let helpInfo = UILabel(frame: CGRect(x: 60, y: 495, width: 200, height: 30))
        helpInfo.textColor = UIColor.black
        helpInfo.text = "帮助与反馈"
        helpInfo.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(helpInfo)
        
        let line7 = UIView(frame: CGRect(x: 0,y: 530,width: self.view.bounds.width ,height: self.view.bounds.height - 580))
        line7.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        view.addSubview(line7)

        
        //消息Button
        let messageBtn=UIButton(type: .system)
        messageBtn.addTarget(self, action: #selector(Mine.gotoMyMessage), for: .touchUpInside)
        
        messageBtn.frame = CGRect(x:self.view.bounds.width - 50,y: 40 ,width:30, height: 30)
        messageBtn.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        self.view.addSubview(messageBtn)

        let messageView = UIImageView(frame: CGRect(x:self.view.bounds.width - 60,y: 40 ,width:30, height: 30))
        messageView.image=UIImage(named:"message.png")
        self.view.addSubview(messageView)
    
    }
    
    func gotoMyMessage(){
        let VC=myMessage()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
    func gotoMyWallet(){
        let VC=myWallet()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func gotoMyCoupon(){
        let VC = couponChoose()
        self.navigationController?.pushViewController(VC, animated: true)
    }

    func gotoHaveSold(){
        let VC=haveSold()
        self.navigationController?.pushViewController(VC, animated: true)
    }
   
    func gotoHaveBought(){
        let VC=haveBought()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func gotoMyFocus(){
        let VC=myFocus()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func gotoSettings(){
        let VC=settings()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func gotoHelpInfo(){
        let VC=helpInfo()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

