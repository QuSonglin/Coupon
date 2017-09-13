//
//  Register1.swift
//  Coupon
//
//  Created by macbook on 17/7/12.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit


//定义协议
protocol pass_parameter_register{
    
    func parameter_register(controller: Register1, u_name:String)
}


class Register1: UIViewController {
    
  //  var res: Int = 2
    
    //定义一个delegate
    var delegate:pass_parameter_register?
    
    //手机号或邮箱
    weak var username: UITextField!
    weak var identifyCode: UITextField!
    
    var getIdentifyCode = UIButton(type: .system)
    

    var countdownTimer: Timer?
    var remainingSeconds: Int = 0 {
        willSet {
            self.getIdentifyCode.setTitle("剩余\(newValue)秒", for: .normal)
    
            if newValue <= 0 {
                self.getIdentifyCode.setTitle("点击获取", for: .normal)
                isCounting = false
            }
        }
    }
    
    var isCounting = false{
        willSet {
            if newValue {
                countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
                
                remainingSeconds = 60
            //    self.getIdentifyCode.setTitleColor(UIColor.lightGray, for: .normal)
            } else {
                countdownTimer?.invalidate()
                countdownTimer = nil
                
             //   self.getIdentifyCode.setTitleColor(UIColor.white, for: .normal)
            }
            
            self.getIdentifyCode.isEnabled = !newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //设置导航栏
        self.navigationController?.isNavigationBarHidden = false
        self.title = "身份验证"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)

        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        
        //返回button
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(Register1.backToWelcome))
        self.navigationItem.leftBarButtonItem = leftBarBtn
        leftBarBtn.tintColor = UIColor.white
        
        
        username = UITextField(frame: CGRect(x: 60, y: 150, width: 300, height: 30))
        username.placeholder = "手机号码"
        username.borderStyle = .none
        username.font = UIFont.systemFont(ofSize: 15)
        username.textColor = UIColor.black
        username.autocapitalizationType = .none
        username.clearButtonMode = .whileEditing
        username.textAlignment = .left
        username.returnKeyType = .search
        username.isSecureTextEntry = false
        username.keyboardType = .default
        view.addSubview(username)
        
        
        let line1 = UIView(frame: CGRect(x: 60,y: 180,width: 300,height: 1))
        line1.backgroundColor = UIColor.lightGray
        view.addSubview(line1)
        
        
        identifyCode = UITextField(frame: CGRect(x: 60, y: 200, width: 200, height: 30))
        identifyCode.placeholder = "验证码"
        identifyCode.borderStyle = .none
        identifyCode.font = UIFont.systemFont(ofSize: 15)
        identifyCode.textColor = UIColor.black
        identifyCode.autocapitalizationType = .none
        identifyCode.clearButtonMode = .whileEditing
        identifyCode.textAlignment = .left
        identifyCode.returnKeyType = .search
        identifyCode.isSecureTextEntry = false
        identifyCode.keyboardType = .numberPad
        view.addSubview(identifyCode)
        
        let line4 = UIView(frame: CGRect(x: 60,y: 230,width: 200,height: 1))
        line4.backgroundColor = UIColor.lightGray
        view.addSubview(line4)
        
        
        
        //  getIdentifyCode.buttonType = .system
        getIdentifyCode.frame = CGRect(x:270, y:200, width:90, height:30)
        getIdentifyCode.setTitle("点击获取", for: UIControlState())
        getIdentifyCode.backgroundColor = UIColor.lightGray
        getIdentifyCode.setTitleColor(UIColor.white,for: UIControlState()) //普通状态下文字的颜色
        getIdentifyCode.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        getIdentifyCode.layer.cornerRadius = 10
        getIdentifyCode.addTarget(self, action: #selector(Register1.getIdentifyCodeNum), for: .touchUpInside)
        self.view.addSubview(getIdentifyCode)

        
        
        let register = UIButton(type: .system)
        register.frame = CGRect(x:60, y:260, width:300, height:40)
        register.setTitle("下一步", for: UIControlState())
        register.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)

        register.setTitleColor(UIColor.white,for: UIControlState()) //普通状态下文字的颜色
        register.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        register.layer.cornerRadius = 10
        
        register.addTarget(self, action: #selector(Register1.register1), for: .touchUpInside)
        
        
        self.view.addSubview(register)
        
    }
    
    /*
    //判断邮箱
    func validateEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    */
    //判断手机号
    func validatePhone(phone: String) -> Bool {
        let phoneRegex = "^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$"
        let phoneTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
    }
    //弹窗
    func promptWindow(ms: String) {
        let alertController = UIAlertController(title: "系统提示",
                                                message: ms, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: {
            action in
            print("点击了确定")
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    //注册验证
    

    
    func register1(){
        
    
        
        if((username.text!.characters.count == 0) || (identifyCode.text!.characters.count == 0) ){
            promptWindow(ms: "存在信息为空")
            return
        }
        if ((validatePhone(phone: username.text!) == false)) {
            promptWindow(ms: "手机号码格式不正确")
            return
        }
        

        
  
        self.submitAuthCode()
        
    
        
        
    }
    
    func getIdentifyCodeNum(){
        if username.text == nil {
            promptWindow(ms: "请输入手机号码")
        }else if (validatePhone(phone: username.text!) == false ) {
            promptWindow(ms: "手机号码格式不正确")
        }else {
            self.getAuthCode()
        }
    }
    
    //获取验证码
    func getAuthCode(){
        
        var phoneNum: String
        phoneNum = username.text!
        
        SMSSDK.getVerificationCode(by: SMSGetCodeMethodSMS, phoneNumber: phoneNum, zone: "86", result: {(error) in
            if error == nil {
                self.promptWindow(ms: "发送成功")
               // NSLog("发送成功")
                self.countDown()
            } else {
               self.promptWindow(ms: "发送失败")
                // NSLog("发送失败！%@" , error)
            }
            
            } as SMSGetCodeResultHandler)
    }
    
    

    //提交验证码
    func submitAuthCode() {
        var authCode: String!
        authCode = identifyCode.text
        var phoneNum: String!
        phoneNum = username.text
        var resultMessage = ""
        
        SMSSDK.commitVerificationCode(authCode, phoneNumber: phoneNum, zone: "86" ,
                                      result:{ (error) in
                                        if(error == nil){
                                            resultMessage = "恭喜您，验证成功！"
                                          //  self.res = 0
                                           
                                            let VC = Register2()
                                            self.delegate = VC as pass_parameter_register
                                            self.delegate?.parameter_register(controller: self, u_name: self.username.text!)
                                            self.navigationController?.pushViewController(VC, animated: true)
                                            
                                            
                                            
                                          //  NSLog("验证成功")
                                        }else{
                                            resultMessage = "很抱歉，验证失败！"
                                          //  NSLog("验证失败！" , error!)
                                           // print("验证失败")
                                        //    self.res = 1
                                            
                                        }
                                        let resultAlertView:UIAlertView = UIAlertView(title: "验证结果", message: resultMessage, delegate: nil, cancelButtonTitle: "确定")
                                        
                                        resultAlertView.show()
        } as SMSCommitCodeResultHandler)
        
    
        
        
    }
    

    
    //验证码倒计时
    func countDown(){
        self.isCounting = true
    }
    func updateTime(){
        self.remainingSeconds = self.remainingSeconds - 1
    }
    
    
    //返回button action
    func backToWelcome(){
        
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.isNavigationBarHidden=true
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

