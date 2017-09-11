//
//  OrderConfirm.swift
//  Coupon
//
//  Created by macbook on 17/7/14.
//  Copyright © 2017年 iss. All rights reserved.
//
import Foundation
import UIKit

class OrderConfirm: UIViewController, pass_parameter3 {
    
    var userID: String?
    var couponID: String?
    var productName: String?
    var pdiscount: String?
    var uselimit: String?
    var ln: CGFloat?
    var pvalue: String?
    var price: String?
    var useTime: String?
    
    var ms: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //设置导航栏
        self.title = "确认订单"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.view.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false

        
        
        //用户头像
        //let SellerImage = UIImage.
        
        //返回button
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(OrderConfirm.backToDetails))
        self.navigationItem.leftBarButtonItem = leftBarBtn
        //self.navigationItem.backBarButtonItem = leftBarBtn
        //leftBarBtn.image = UIImage.
        leftBarBtn.tintColor = UIColor.white
        
        
        
        
        let sview = UIScrollView()
        sview.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 60)
        sview.contentSize = CGSize(width: self.view.bounds.width, height: 230 + 30 * ln!)
        sview.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        sview.isPagingEnabled = true
        sview.showsVerticalScrollIndicator = true
        sview.scrollsToTop = true
        view.addSubview(sview)
        
        let view1 = UIView(frame: CGRect(x: 0,y: 0,width: 420,height: 170))
        view1.backgroundColor = UIColor.white
        sview.addSubview(view1)
        
        //商品名
        let pname_label = UILabel(frame: CGRect(x: 30, y: 35, width: 200, height: 30))
        pname_label.textColor = UIColor.darkGray
        pname_label.text = "商品名称：" + self.productName!
        pname_label.font = UIFont.systemFont(ofSize: 16)
        sview.addSubview(pname_label)

        
        
        let line1 = UIView(frame: CGRect(x: 30,y: 70,width: 360,height: 1))
        line1.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        sview.addSubview(line1)
        
        //优惠额度
        let pdiscount_label = UILabel(frame: CGRect(x: 30, y: 85, width: 200, height: 30))
        pdiscount_label.textColor = UIColor.darkGray
        pdiscount_label.text = "优惠额度：" + self.pdiscount!
        pdiscount_label.font = UIFont.systemFont(ofSize: 16)
        sview.addSubview(pdiscount_label)
        
        
        let line2 = UIView(frame: CGRect(x: 30,y: 120,width: 360,height: 1))
        line2.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        sview.addSubview(line2)
        
        //有效期
        let validTime = UILabel(frame: CGRect(x: 30, y: 135, width: 200, height: 30))
        validTime.textColor = UIColor.darkGray
        validTime.text = "有效期限：" + self.useTime!
        validTime.font = UIFont.systemFont(ofSize: 16)
        sview.addSubview(validTime)
        

        
        let view4 = UIView(frame: CGRect(x: 0,y: 186,width: self.view.bounds.width,height: 35 + 30 * ln!))
        view4.backgroundColor = UIColor.white
        sview.addSubview(view4)
        
        
        //使用门槛
        let useCondition = UILabel(frame: CGRect(x: 30, y: 190, width: 200, height: 30 + 30 * ln!))
        useCondition.textColor = UIColor.darkGray
        useCondition.numberOfLines = 0
        useCondition.text = "使用门槛：" + self.uselimit!
        //useCondition.font = UIFont.systemFont(ofSize: 15)
        
        //通过富文本来设置行间距
        let paraph = NSMutableParagraphStyle()
        
        paraph.lineSpacing = 8
        //样式属性集合
        let attributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 16),
                          NSParagraphStyleAttributeName: paraph]
        useCondition.attributedText = NSAttributedString(string: useCondition.text!, attributes: attributes)
        
        sview.addSubview(useCondition)
        
    
        
        let money = UIView()
        money.frame = CGRect(x: 0,y: self.view.bounds.height - 48 - 60, width: self.view.bounds.width, height: 48)
     //   money.frame = CGRect(x: 0,y: 600, width: 420, height: 100)
        
        money.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
     //   money.backgroundColor = UIColor.black
        self.view.addSubview(money)
        
        print(self.view.bounds.height)
        print(self.view.bounds.width)
        
        let line3 = UIView(frame: CGRect(x: 0,y: self.view.bounds.height - 48 - 60, width: self.view.bounds.width,height: 1))
        line3.backgroundColor = UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1)
        self.view.addSubview(line3)
 
        
        let amount = UILabel()
        amount.frame = CGRect(x: 30, y: self.view.bounds.height - 43 - 60, width: 200, height: 30)
        amount.textColor = UIColor.darkGray
        amount.text = "总计：¥" + self.price!
        amount.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(amount)
        
        //购买button
        let payBtn = UIButton(type: .system)
        
        payBtn.frame = CGRect(x: ( (self.view.bounds.width / 3 ) + (self.view.bounds.width / 3 )), y: self.view.bounds.height - 48 - 60, width: self.view.bounds.width / 3, height:48)
     
        payBtn.addTarget(self, action: #selector(OrderConfirm.openPaySuccessVC), for: .touchUpInside)
        
        payBtn.setTitle("确认支付", for: UIControlState())
        payBtn.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        payBtn.setTitleColor(UIColor.white,for: UIControlState()) //普通状态下文字的颜色
        payBtn.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        self.view.addSubview(payBtn)
        
        
        
        
        
    }
    
    //返回button action
    func backToDetails(){
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.popViewController(animated: true)
    
    }
    
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
    
    func openPaySuccessVC(){
        
        var tz: String!
      //  tz = String("nil")
        
        
        //print(password)
        
        //(1）设置请求路径
        let url:NSURL = NSURL(string:"http://192.168.204.83:1080/post_buyCoupon")!//不需要传递参数
        
        //(2) 创建请求对象
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL) //默认为get请求
        request.timeoutInterval = 5.0 //设置请求超时为5秒
        request.httpMethod = "POST"  //设置请求方法
        
        //设置请求体
        let param:NSString = NSString(format:"couponID=%@&userID=%@", couponID!, userID!)
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
                
                let errno = json["errno"].int
             
            //    let result = json["result"].string
                let message = json["message"].string
                
                if (errno != nil) {
                    
                    print("结果:", errno!)
                    print("信息:", message!)
                    
                    self.ms = message!
                    tz = String(describing: errno)
                    
                    
                }
                
            }
            
            semaphore.signal()
            
            } as URLSessionTask
        
        
        
        dataTask.resume()
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        print("执行完毕")
        
        if(tz == nil){
            promptWindow(ms: "购买失败")
            
        } else if(tz == "0"){
            let VC = PaySuccess()
            self.navigationController?.pushViewController(VC, animated: true)
            
        }else {
    
            promptWindow(ms: self.ms!)
        }
    }
    
    func parameter3(controller: Details, user_id: String, coupon_id: String, p_name: String, p_discount: String, p_uselimit: String, p_ln: CGFloat, p_price: String, p_value: String, p_usetime: String) {
        self.productName = p_name
        self.pdiscount = p_discount
        self.uselimit = p_uselimit
        self.ln = p_ln
        self.price = p_price
        self.pvalue = p_value
        self.useTime = p_usetime
        self.userID = user_id
        self.couponID = coupon_id
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
