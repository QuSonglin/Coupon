//
//  helpInfo.swift
//  Coupon
//
//  Created by macbook on 2017/7/18.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit

class helpInfo: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title="意见反馈"
        //新建一个灰色矩形当作背景
        let view1 = UIView(frame: CGRect(x: 0,y: 0,width: self.view.bounds.width ,height: self.view.bounds.height))
        view1.backgroundColor = UIColor.lightGray
        view.addSubview(view1)
        
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector    (helpInfo.backToMine))
        self.navigationItem.leftBarButtonItem = leftBarBtn
        leftBarBtn.tintColor = UIColor.white
        
        let view2 = UIView(frame: CGRect(x: 0,y: 100,width: self.view.bounds.width ,height: 216))
        view2.backgroundColor = UIColor.white
        view.addSubview(view2)

        let feedback = UILabel(frame: CGRect(x: 20, y: 70, width: UIScreen.main.bounds.width, height: 30))
        feedback.textColor = UIColor.black
        feedback.text = "对该产品的意见反馈："
        feedback.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(feedback)
        
        let info = UITextView(frame: CGRect(x: 20, y: 108, width: UIScreen.main.bounds.width-40, height: 200))
        //圆角矩形边框
        info.layer.borderWidth=1
        info.layer.cornerRadius=16
        //info.borderStyle=UITextBorderStyle.roundedRect
        info.backgroundColor=UIColor(red:219/255,green:219/255,blue:219/255,alpha:1)
        info.textColor = UIColor.black
        //显示便于输入英文字母的键盘
        info.keyboardType=UIKeyboardType.asciiCapable
        //使文本框在界面打开时就获取焦点，并获得输入键盘
        info.becomeFirstResponder()
        //设置键盘return键的格式,表示完成输入
        info.returnKeyType=UIReturnKeyType.done
        info.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(info)
        
        //提交按钮
        let submitBtn = UIButton(type: .system)
        submitBtn.addTarget(self, action: #selector(helpInfo.submitSuccess), for: .touchUpInside)
        submitBtn .frame = CGRect(x:UIScreen.main.bounds.width/2-30, y: 332, width: 60, height:30)
        submitBtn .backgroundColor = UIColor(red:24/255,green:116/255,blue:205/255,alpha:1)
        submitBtn.setTitle("提交", for: .normal)
        submitBtn.setTitle("提交", for: .highlighted)
        submitBtn.setTitleColor(UIColor.white,for: UIControlState()) //普通状态下文字的颜色
        submitBtn.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色

        self.view.addSubview(submitBtn)
        
    }
    
    func backToMine(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func submitSuccess(){
        
        let alertController = UIAlertController(title: "系统提示",
                                                message: "提交成功", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: {
            action in
            print("点击了确定")
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
