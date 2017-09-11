//
//  Forget2.swift
//  Coupon
//
//  Created by macbook on 17/7/12.
//  Copyright © 2017年 iss. All rights reserved.
//


import Foundation
import UIKit

class Forget2: UIViewController ,pass_parameter_forget{
    
    var phoneNum: String?


    weak var setPassword: UITextField!
    weak var identifyPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //设置导航栏
        self.navigationController?.isNavigationBarHidden = false
        self.title = "重置密码"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        
        //返回button
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(Forget2.backToForget1))
        //let leftBarBtn = UIBarButtonItem(title: "back", style: .Plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftBarBtn
        //leftBarBtn.image = UIImage.
        leftBarBtn.tintColor = UIColor.white
        
        
        
        
        setPassword = UITextField(frame: CGRect(x: 60, y: 150, width: 300, height: 30))
        setPassword.placeholder = "输入新密码"
        setPassword.borderStyle = .none
        setPassword.font = UIFont.systemFont(ofSize: 15)
        setPassword.textColor = UIColor.black
        setPassword.autocapitalizationType = .none
        setPassword.clearButtonMode = .whileEditing
        setPassword.textAlignment = .left
        setPassword.returnKeyType = .search
        setPassword.isSecureTextEntry = true
        setPassword.keyboardType = .numberPad
        view.addSubview(setPassword)
        
        let line3 = UIView(frame: CGRect(x: 60,y: 180,width: 300,height: 1))
        line3.backgroundColor = UIColor.lightGray
        view.addSubview(line3)
        
        identifyPassword = UITextField(frame: CGRect(x: 60, y: 200, width: 300, height: 30))
        identifyPassword.placeholder = "确认密码"
        identifyPassword.borderStyle = .none
        identifyPassword.font = UIFont.systemFont(ofSize: 15)
        identifyPassword.textColor = UIColor.black
        identifyPassword.autocapitalizationType = .none
        identifyPassword.clearButtonMode = .whileEditing
        identifyPassword.textAlignment = .left
        identifyPassword.returnKeyType = .search
        identifyPassword.isSecureTextEntry = true
        identifyPassword.keyboardType = .numberPad
        view.addSubview(identifyPassword)
        
        let line4 = UIView(frame: CGRect(x: 60,y: 230,width: 300,height: 1))
        line4.backgroundColor = UIColor.lightGray
        view.addSubview(line4)
        
        let button1 = UIButton(type: .system)
        button1.frame = CGRect(x:60, y:270, width:300, height:40)
        button1.setTitle("确认", for: UIControlState())
        button1.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        button1.addTarget(self, action: #selector(Forget2.update), for: .touchUpInside)
        button1.setTitleColor(UIColor.white,for: UIControlState()) //普通状态下文字的颜色
        button1.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        button1.layer.cornerRadius = 10
        self.view.addSubview(button1)
        
    }
    
    //返回button action
    func backToForget1(){
        self.navigationController?.popViewController(animated: true)
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
    func update(){
        
        if((identifyPassword.text!.characters.count == 0) || (setPassword.text!.characters.count == 0)){
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
        //let url:NSURL = NSURL(string:"http://192.168.204.83:1080/post_updatePassword")!//不需要传递参数
        let url:NSURL = NSURL(string: URLString + "/post_updatePassword")!//不需要传递参数
        
        //(2) 创建请求对象
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL) //默认为get请求
        request.timeoutInterval = 5.0 //设置请求超时为5秒
        request.httpMethod = "POST"  //设置请求方法
        
        
        //设置请求体
        let param:NSString = NSString(format:"phoneNum=%@&password=%@", self.phoneNum!, password.MD5())
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
                
                if(result == nil){
                    print("修改失败")
                
                } else if (result != nil) {
                    
                    print("result:", result!)
                    
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
            let VC = Login()
            self.navigationController?.pushViewController(VC, animated: true)
        }
        
        
    }
    
    
    
    func parameter_forget(controller: Forget1, phoneNum: String) {
        self.phoneNum = phoneNum
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

