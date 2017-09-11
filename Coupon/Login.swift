//
//  Login.swift
//  Coupon
//
//  Created by macbook on 17/7/11.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit




//定义协议
protocol pass_parameter{
    
    func parameter(controller: Login, u_id:String)
}


class Login: UIViewController {
    
    
    //定义一个delegate
    var delegate:pass_parameter?
    
    weak var username: UITextField!
    weak var pwd: UITextField!
    var user_id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        //设置导航栏
        //1.创建首页导航控制器
        
        self.navigationController?.isNavigationBarHidden = false
        
        self.title = "登录"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        
        //返回button
        
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(Login.backToWelcome))
        
        
        //let leftBarBtn = UIBarButtonItem(title: "back", style: .Plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftBarBtn
        
        //self.navigationItem.backBarButtonItem = leftBarBtn
        
        //leftBarBtn.image = UIImage(named: "return")
        leftBarBtn.tintColor = UIColor.white
        
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "03.jpg")!)
        
       
        //创建图片视图
        let imageView = UIImageView(image:UIImage(named:"logo"))
        imageView.frame = CGRect(x:150, y:160, width:120, height:120)
        self.view.addSubview(imageView)
        
        
        
        //weak var username: UITextField!
        username = UITextField(frame: CGRect(x: 60, y: 350, width: 300, height: 30))
        //设置文本编辑框显示文字
        //textField1.text = "账号"
        //设置文本编辑框占位文字
        username.placeholder = "用户名/手机号"
        //设置文本编辑框的边框显示类型
        //textField1.borderStyle = .RoundedRect
        username.borderStyle = .none
        //设置文本编辑框的文字字体
        username.font = UIFont.systemFont(ofSize: 15)
        //设置文本编辑框的文本颜色
        username.textColor = UIColor.black
        //设置文本编辑框输入文本时首字母是否自动大写
        username.autocapitalizationType = .none
        //设置文本编辑框清除按钮显示模式
        username.clearButtonMode = .whileEditing
        //设置文本编辑框的文本对齐方式
        username.textAlignment = .left
        //设置文本编辑框返回键显示类型
        username.returnKeyType = .search
        //设置是否为安全文本输入状态
        username.isSecureTextEntry = false
        //设置输入键盘类型
        username.keyboardType = .emailAddress
        //设置文本编辑框的代理
        //textField1.delegate = self
        
        //textField1.layer.cornerRadius = 10
        //textField1.layer.borderWidth = 1
        //textField1.layer.borderColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1).CGColor
        
        //唤起键盘，让文本编辑框成为第一响应者
        username.becomeFirstResponder()
        
        view.addSubview(username)
        
        let line1 = UIView(frame: CGRect(x: 60,y: 380,width: 300,height: 1))
        line1.backgroundColor = UIColor.lightGray
        view.addSubview(line1)
        
        
        
        
        
        pwd = UITextField(frame: CGRect(x: 60, y: 400, width: 300, height: 30))
        //设置文本编辑框占位文字
        pwd.placeholder = "密码"
        //设置文本编辑框的边框显示类型
        pwd.borderStyle = .none
        //设置文本编辑框的文字字体
        pwd.font = UIFont.systemFont(ofSize: 15)
        //设置文本编辑框的文本颜色
        pwd.textColor = UIColor.black
        //设置文本编辑框输入文本时首字母是否自动大写
        pwd.autocapitalizationType = .none
        //设置文本编辑框清除按钮显示模式
        pwd.clearButtonMode = .whileEditing
        //设置文本编辑框的文本对齐方式
        pwd.textAlignment = .left
        //设置文本编辑框返回键显示类型
        pwd.returnKeyType = .search
        //设置是否为安全文本输入状态
        pwd.isSecureTextEntry = true
        //设置输入键盘类型
        pwd.keyboardType = .namePhonePad
        view.addSubview(pwd)
        
        let line2 = UIView(frame: CGRect(x: 60,y: 430,width: 300,height: 1))
        line2.backgroundColor = UIColor.lightGray
        view.addSubview(line2)
        
        
        

        
        
        //创建button .System 默认文字为蓝色，有高亮状态
        let loginBtn = UIButton(type: .system)
        //给定button在view上的位置
        loginBtn.frame = CGRect(x:60, y:460, width:300, height:40)
        //设置button内容
        loginBtn.setTitle("登录", for: UIControlState())
        //button背景色
        
        //button1.backgroundColor = UIColor(red: 228/255, green: 67/255, blue: 72/255, alpha: 1)
        //美工给的色
        loginBtn.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        //设置文字颜色
        loginBtn.setTitleColor(UIColor.white,for: UIControlState()) //普通状态下文字的颜色
        loginBtn.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        
        //设置圆角
        loginBtn.layer.cornerRadius = 10
        //设置边框颜色
        //inputTextView.layer.borderColor = UIColor(red: 60/255, green: 40/255, blue: 129/255, alpha: 1).CGColor;
        
        loginBtn.addTarget(self, action: #selector(Login.login), for: .touchUpInside)
        
        
        
        self.view.addSubview(loginBtn)
        
        
        
        //创建button .System 默认文字为蓝色，有高亮状态
        let button2 = UIButton(type: .system)
        //给定button在view上的位置
        button2.frame = CGRect(x:280, y:510, width:80, height:20)
        //设置button内容
        button2.setTitle("忘记密码？", for: UIControlState())
        
        //设置文字颜色
        button2.setTitleColor(UIColor.lightGray,for: UIControlState()) //普通状态下文字的颜色
        button2.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        
        button2.addTarget(self, action: #selector(Login.openForgetVC), for: .touchUpInside)
        
        
        self.view.addSubview(button2)
        
        
        
    }
    
    
    
    
    
    func login()
    {
        //print(username.text!)
        //print(pwd.text!)
        
    
        var tz: String!
        tz = String("nil")
        
        let password: String = self.pwd.text! + "UHui"
        //let passwordtest: String = "1" + "UHui"
        print(password)
        
        //(1）设置请求路径
        let url:NSURL = NSURL(string: URLString + "/post_loginForAndroid")!//不需要传递参数
        
        //(2) 创建请求对象
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL) //默认为get请求
        request.timeoutInterval = 5.0 //设置请求超时为5秒
        request.httpMethod = "POST"  //设置请求方法
        
        //设置请求体
        let param:NSString = NSString(format:"username=%@&password=%@",self.username.text!,password.MD5())
        //let param:NSString = NSString(format:"username=%@&password=%@",username,passwordtest.MD5())
        //把拼接后的字符串转换为data，设置请求体
        request.httpBody = param.data(using: String.Encoding.utf8.rawValue)
        
        
        //print(password.MD5())
        
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
                
                let error = json["error"].string
                let result = json["result"].string
                let userid = json["userid"].string
                
                if(error != nil) {
                    print(error!)
                    
                    tz = error
                    
                } else if ((result != nil) && (userid != nil)) {
                    
                    print("result:", result!)
                    print("userid:", userid!)
                    
                    UID = userid!
                    self.user_id = userid!
                    print(self.user_id!)
                    
                    
                    
                    tz = result
                    
                    print(tz)
                }
 
            }
            
            semaphore.signal()
            
        } as URLSessionTask
        
        
        
        dataTask.resume()
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        print("执行完毕")
        
        if(tz == "success"){
            let VC = TabBarViewController()
            delegate = VC as pass_parameter
            delegate?.parameter(controller: self, u_id: user_id!)
            self.present(VC, animated: true, completion: nil)
            
           
         //   self.navigationController?.pushViewController(VC, animated: true)
            
        }else if(tz == "用户不存在"){
            promptWindow(ms: "用户不存在")
        }

    }
 
    //返回button action
    func backToWelcome(){
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.isNavigationBarHidden=true
    }
 
    func openForgetVC(){
        let VC = Forget1()
        self.navigationController?.pushViewController(VC, animated: true)
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



