//
//  Forget1.swift
//  Coupon
//
//  Created by macbook on 17/7/12.
//  Copyright © 2017年 iss. All rights reserved.
//


import Foundation
import UIKit


protocol pass_parameter_forget{
    
    func parameter_forget(controller: Forget1, phoneNum:String)
}



class Forget1: UIViewController {
    
    //定义一个delegate
    var delegate:pass_parameter_forget?
    
 //   var userid: String?
    
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
        self.title = "验证信息"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)

        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        
        //返回button
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(Forget1.backToLogin))
        //let leftBarBtn = UIBarButtonItem(title: "back", style: .Plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftBarBtn
        //leftBarBtn.image = UIImage.
        leftBarBtn.tintColor = UIColor.white
        

        
        username = UITextField(frame: CGRect(x: 60, y: 150, width: 300, height: 30))
        username.placeholder = "请输入手机号码"
        username.borderStyle = .none
        username.font = UIFont.systemFont(ofSize: 15)
        username.textColor = UIColor.black
        username.autocapitalizationType = .none
        username.clearButtonMode = .whileEditing
        username.textAlignment = .left
        username.returnKeyType = .search
        username.isSecureTextEntry = false
        username.keyboardType = .numberPad
        username.becomeFirstResponder()
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
        getIdentifyCode.addTarget(self, action: #selector(Forget1.getIdentifyCodeNum), for: .touchUpInside)
        self.view.addSubview(getIdentifyCode)

        
        
        let button1 = UIButton(type: .system)
        button1.frame = CGRect(x:60, y:270, width:300, height:40)
        button1.setTitle("下一步", for: UIControlState())
        button1.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)

        button1.addTarget(self, action: #selector(Forget1.nextScene), for: .touchUpInside)
        
        button1.setTitleColor(UIColor.white,for: UIControlState()) //普通状态下文字的颜色
        button1.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        button1.layer.cornerRadius = 10
        self.view.addSubview(button1)
        
    }
    
    //返回button action
    func backToLogin(){
        self.navigationController?.popViewController(animated: true)
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

    //验证码倒计时
    func countDown(){
        self.isCounting = true
    }
    func updateTime(){
        self.remainingSeconds = self.remainingSeconds - 1
    }
    
    //注册验证
    func nextScene(){
        
        if(username.text!.characters.count == 0){
            promptWindow(ms: "手机号码为空")
            return
        }
        if ((validatePhone(phone: username.text!) == false)) {
            promptWindow(ms: "手机号码格式不正确")
            return
        }
   
        
        
        var tz: String!
        tz = String("nil")
        
        
        
        //(1）设置请求路径
        let url:NSURL = NSURL(string:"http://192.168.204.83:1080/post_checkUsername")!//不需要传递参数
        
        //(2) 创建请求对象
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL) //默认为get请求
        request.timeoutInterval = 5.0 //设置请求超时为5秒
        request.httpMethod = "POST"  //设置请求方法
        
        
        //设置请求体
        let param:NSString = NSString(format:"username=%@",self.username.text!)
        //把拼接后的字符串转换为data，设置请求体
        request.httpBody = param.data(using: String.Encoding.utf8.rawValue)
        
        
        //(3) 发送请求
        let session=URLSession.shared
        let semaphore = DispatchSemaphore(value: 0)
        let dataTask=session.dataTask(with: request as URLRequest) { (data, reponse, error) -> Void in
            if (error != nil){
                print("Error:\(error!)")
            }
            else{
                //服务器返回：请求方式 = POST，返回数据格式 = JSON
                let str = NSString(data: data!, encoding:String.Encoding.utf8.rawValue)
                print(str!)
                
                let json = JSON(data!)
                
                
                let result = json["result"].string
              //  self.userid = json["userid"].string
                
                if(result == nil){
                    print("验证失败")
                } else if(result == "1") {
                    print("验证失败：", result!)
                    
                } else if (result != nil) {
                    
                    print("结果:", result!)
                    
                
                }
                tz = result

                
            }
            
            semaphore.signal()
            
            } as URLSessionTask
        
        
        
        dataTask.resume()
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        print("执行完毕")
        
        if(tz == "1"){
            promptWindow(ms: "手机号码不存在")
            return
        }
        if(tz == "0"){
            
            self.submitAuthCode()
            
        }else {
            promptWindow(ms: "操作失败")
        }
        
        
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
                                            
                                            let VC = Forget2()
                                            self.delegate = VC as pass_parameter_forget
                                            self.delegate?.parameter_forget(controller: self, phoneNum: self.username.text!)
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

  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

