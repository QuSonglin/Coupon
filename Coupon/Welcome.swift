//
//  Welcome.swift
//  Coupon
//
//  Created by macbook on 17/7/13.
//  Copyright © 2017年 iss. All rights reserved.
//
import Foundation
import UIKit

class Welcome: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        self.navigationController?.isNavigationBarHidden=true
        
        //创建图片视图
        let imageView = UIImageView(image:UIImage(named:"logo"))
        imageView.frame = CGRect(x:150, y:160, width:120, height:120)
        self.view.addSubview(imageView)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bgi.jpg")!)

        

        let login = UIButton(type: .system)
        // 响应事件
        
        login.addTarget(self, action: #selector(Welcome.openLoginVC), for: .touchUpInside)
        login.frame = CGRect(x:60, y:460, width:120, height:40)
        login.setTitle("登录", for: UIControlState())
        login.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)

        login.setTitleColor(UIColor.white,for: UIControlState()) //普通状态下文字的颜色
        login.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        login.layer.cornerRadius = 10
        self.view.addSubview(login)
        
        let register = UIButton(type: .system)
        
        register.addTarget(self, action: #selector(Welcome.openRegisterVC), for: .touchUpInside)
        
        register.frame = CGRect(x:240, y:460, width:120, height:40)
        register.setTitle("注册", for: UIControlState())
        register.setTitleColor(UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1),for: UIControlState()) //普通状态下文字的颜色
        register.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        register.layer.cornerRadius = 10
        register.layer.borderWidth = 1
        register.layer.borderColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1).cgColor
        self.view.addSubview(register)
        
        /*
        let button3 = UIButton(type: .system)
        button3.frame = CGRect(x:280, y:510, width:80, height:20)
        button3.setTitle("随便看看", for: UIControlState())
        button3.setTitleColor(UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 0.6),for: UIControlState()) //普通状态下文字的颜色
        button3.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        self.view.addSubview(button3)
        
        */
    }
    
    
    func openLoginVC(){
        let VC = Login()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func openRegisterVC(){
        

        let VC = Register1()
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

