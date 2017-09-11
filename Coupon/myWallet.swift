//
//  myWallet.swift
//  Coupon
//
//  Created by yaowenqing on 2017/7/22.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit

class myWallet: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        self.navigationController?.isNavigationBarHidden = false
        self.title = "我的钱包"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(myWallet.backToMine))
        self.navigationItem.leftBarButtonItem = leftBarBtn
        leftBarBtn.tintColor = UIColor.white


        
        //新建一个矩形
        let view1 = UIView(frame: CGRect(x: 0,y: 60,width: self.view.bounds.width ,height: 250))
        view1.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        view.addSubview(view1)
        
        //标签，标记账户余额
        let money1 = UILabel(frame: CGRect(x: 30, y: 85, width: 200, height: 30))
        money1.textColor = UIColor.white
        money1.text = "账户余额:（U币）"
        money1.font = UIFont.systemFont(ofSize: 19)
        self.view.addSubview(money1)
        
        //用来显示账户余额的textfield
        let money2 = UITextField(frame: CGRect(x: 45, y: 150, width: 300, height: 60))
        money2.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        money2.text = "100.00"
        money2.font = UIFont.systemFont(ofSize: 64)
        self.view.addSubview(money2)
        
        //用来充值余额的button
        let addWalletBtn = UIButton(type: .system)
        addWalletBtn.addTarget(self, action: #selector(Mine.gotoMyWallet), for: .touchUpInside)
        addWalletBtn.frame = CGRect(x:(self.view.bounds.width)/2-150,y: 360, width: 300, height:60)
        addWalletBtn.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        addWalletBtn.setTitle("充值U币", for: UIControlState())
        addWalletBtn.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1),for: UIControlState()) //普通状态下文字的颜色
        addWalletBtn.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        addWalletBtn.layer.cornerRadius = 10
        self.view.addSubview(addWalletBtn)
        
    }
    
    func backToMine(){
        self.navigationController?.popViewController(animated: true)
    }

}
