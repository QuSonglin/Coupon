//
//  Register2.swift
//  Coupon
//
//  Created by macbook on 17/7/30.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit

class Register2: UIViewController, pass_parameter_register {

    //昵称
    weak var nickname: UITextField!
    weak var sex: UITextField!
    //手机号或邮箱
    var phoneNum: String?
    
    weak var setPassword: UITextField!
    weak var identifyPassword: UITextField!
    weak var dropBoxView : TGDropBoxView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //设置导航栏
        self.navigationController?.isNavigationBarHidden = false
        self.title = "注册"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        
        //返回button
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(Register2.backToRegister1))
        self.navigationItem.leftBarButtonItem = leftBarBtn
        //self.navigationItem.backBarButtonItem = leftBarBtn
        //leftBarBtn.image = UIImage.
        leftBarBtn.tintColor = UIColor.white
        
        
        
        nickname = UITextField(frame: CGRect(x: 60, y: 150, width: 300, height: 30))
        //设置文本编辑框占位文字
        nickname.placeholder = "昵称"
        //设置文本编辑框的边框显示类型
        //textField1.borderStyle = .RoundedRect
        nickname.borderStyle = .none
        //设置文本编辑框的文字字体
        nickname.font = UIFont.systemFont(ofSize: 15)
        //设置文本编辑框的文本颜色
        nickname.textColor = UIColor.black
        //设置文本编辑框输入文本时首字母是否自动大写
        nickname.autocapitalizationType = .none
        //设置文本编辑框清除按钮显示模式
        nickname.clearButtonMode = .whileEditing
        //设置文本编辑框的文本对齐方式
        //textField1.textAlignment = .Center
        nickname.textAlignment = .left
        //设置文本编辑框返回键显示类型
        nickname.returnKeyType = .search
        //设置是否为安全文本输入状态
        nickname.isSecureTextEntry = false
        //设置输入键盘类型
        nickname.keyboardType = .default
        //唤起键盘，让文本编辑框成为第一响应者
        nickname.becomeFirstResponder()
        view.addSubview(nickname)
        
        
        let line1 = UIView(frame: CGRect(x: 60,y: 180,width: 300,height: 1))
        line1.backgroundColor = UIColor.lightGray
        view.addSubview(line1)
        
        
        
        
        let defaultTitle = "性别"
        let choices = ["男", "女"]
        let rect = CGRect(x: 60, y: 200, width: 300, height: 30)
        dropBoxView = TGDropBoxView(parentVC: self, title: defaultTitle, items: choices, frame: rect)
        dropBoxView.isHightWhenShowList = true
        dropBoxView.willShowOrHideBoxListHandler = { (isShow) in
            if isShow { NSLog("will show choices") }
            else { NSLog("will hide choices") }
        }
        dropBoxView.didShowOrHideBoxListHandler = { (isShow) in
            if isShow { NSLog("did show choices") }
            else { NSLog("did hide choices") }
        }
        dropBoxView.didSelectBoxItemHandler = { (row) in
            NSLog("selected No.\(row): \(self.dropBoxView.currentTitle())")
        }
        self.view.addSubview(dropBoxView)
        
        
        let line2 = UIView(frame: CGRect(x: 60,y: 230,width: 300,height: 1))
        line2.backgroundColor = UIColor.lightGray
        view.addSubview(line2)
        

        setPassword = UITextField(frame: CGRect(x: 60, y: 250, width: 300, height: 30))
        setPassword.placeholder = "设置密码"
        setPassword.borderStyle = .none
        setPassword.font = UIFont.systemFont(ofSize: 15)
        setPassword.textColor = UIColor.black
        setPassword.autocapitalizationType = .none
        setPassword.clearButtonMode = .whileEditing
        setPassword.textAlignment = .left
        setPassword.returnKeyType = .search
        setPassword.isSecureTextEntry = true
        setPassword.keyboardType = .default
        view.addSubview(setPassword)
        
        let line5 = UIView(frame: CGRect(x: 60,y: 280,width: 300,height: 1))
        line5.backgroundColor = UIColor.lightGray
        view.addSubview(line5)
        
        
        identifyPassword = UITextField(frame: CGRect(x: 60, y: 300, width: 300, height: 30))
        identifyPassword.placeholder = "确认密码"
        identifyPassword.borderStyle = .none
        identifyPassword.font = UIFont.systemFont(ofSize: 15)
        identifyPassword.textColor = UIColor.black
        identifyPassword.autocapitalizationType = .none
        identifyPassword.clearButtonMode = .whileEditing
        identifyPassword.textAlignment = .left
        identifyPassword.returnKeyType = .search
        identifyPassword.isSecureTextEntry = true
        identifyPassword.keyboardType = .default
        view.addSubview(identifyPassword)
        
        let line6 = UIView(frame: CGRect(x: 60,y: 330,width: 300,height: 1))
        line6.backgroundColor = UIColor.lightGray
        view.addSubview(line6)
        
        
        let register = UIButton(type: .system)
        register.frame = CGRect(x:60, y:360, width:300, height:40)
        register.setTitle("注册", for: UIControlState())
        register.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        
        register.setTitleColor(UIColor.white,for: UIControlState()) //普通状态下文字的颜色
        register.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        register.layer.cornerRadius = 10
        
        register.addTarget(self, action: #selector(Register2.register), for: .touchUpInside)
        
        
        self.view.addSubview(register)
        
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

    
    func register(){
        
        
        
        if((nickname.text!.characters.count == 0) || (self.dropBoxView.currentTitle().characters.count == 0) || (identifyPassword.text!.characters.count == 0) || (setPassword.text!.characters.count == 0)){
            promptWindow(ms: "存在信息为空")
            return
        }

        if((setPassword.text!) != (identifyPassword.text!)) {
            promptWindow(ms: "两次输入密码不一致")
            return
        }
        
        
        
        let password: String = self.setPassword.text! + "UHui"
        var tz: String!
        tz = String("nil")
        
        
        
        //(1）设置请求路径
        //let url:NSURL = NSURL(string:"http://192.168.204.83:1080/post_signUpForAndroid")!//不需要传递参数
        let url:NSURL = NSURL(string: URLString + "/post_signUpForAndroid")!//不需要传递参数
        //(2) 创建请求对象
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL) //默认为get请求
        request.timeoutInterval = 5.0 //设置请求超时为5秒
        request.httpMethod = "POST"  //设置请求方法
        
        print(self.dropBoxView.currentTitle())
        
        //设置请求体
        let param:NSString = NSString(format:"username=%@&nickname=%@&password=%@&gender=%@",self.phoneNum!, self.nickname.text!, password.MD5(), self.dropBoxView.currentTitle())
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
                
                let errno = json["errno"].string
                let message = json["message"].string
                
                if(errno == nil){
                    print("注册失败")
                } else if(errno == "1") {
                    print("注册失败：", message!)
                    
                } else if ((errno != nil) && (message != nil)) {
                    
                    print("errno:", errno!)
                    print("message:", message!)
                    
                    tz = errno
                    
                    
                    print(tz)
                }
                
            }
            
            semaphore.signal()
            
            } as URLSessionTask
        
        
        
        dataTask.resume()
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        print("执行完毕")
        
        if(tz == "0"){
            let VC = Login()
            self.navigationController?.pushViewController(VC, animated: true)
        } else {
            promptWindow(ms: "注册失败")
        }
        
        
    }
    

    
    func parameter_register(controller: Register1, u_name: String) {
        self.phoneNum = u_name
    }
    
    
    //返回button action
    func backToRegister1(){
        
        self.navigationController?.popViewController(animated: true)
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

