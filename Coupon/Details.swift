//
//  Details.swift
//  Coupon
//
//
//展示以下信息：
//商品名、商家名、优惠额度、使用门槛、估值、使用期限、出售者定价、出售者用户名、用户头像
//页面中还应有一个［折叠区］域用于显示优惠券详细使用限制，如店家、时间等。
//用户头像
//func 通过点击用户头像，可以浏览出售者的个人信息，包括用户名、头像、性别、已出售的优惠券、正在出售的优惠券
//购买按钮
//func 点击购买按钮后跳转到支付页面，显示该订单的详情以确认信息，包括价格、商品名、使用限制、优惠额度。在支付页面点击确定后付款并获得优惠券->paysuccess
//关注按钮
//func 点击关注按钮后将本优惠券加入“我的关注”中。
//
//
//  Created by macbook on 17/7/14.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit





//定义协议
protocol pass_parameter2{
    
    func parameter2(controller: Details, u_id:String, u_name:String, u_pic: UIImage, u_gender:String)
}

protocol pass_parameter3 {
    func parameter3(controller: Details, user_id: String, coupon_id: String, p_name: String, p_discount: String, p_uselimit: String, p_ln: CGFloat, p_price: String, p_value: String, p_usetime: String)
}





class Details: UIViewController, Couponid {
    

    //定义一个delegate
    var delegate2:pass_parameter2?
    var delegate3:pass_parameter3?

    var user_id: String?
    var seller_id:String?

  //  var sellerName:String?
   // var sellerPic:String?

 
    //优惠券id
    var cpId: String = "001"
    
    
     //商品图片
    var productPic: String = "coffee.jpg"
   
    
    
   // var nsd = NSData.init(contentsOf: URL(fileURLWithPath: ""))
    var img = UIImage(named: "coffee")
    var img2 = UIImage(named: "logo")
    
 //   var img = UIImage(data: NSData.init(contentsOf: URL(fileURLWithPath: "")) as Data)
    
    
    //商品名
    var productName: String = ""
    //用户定价
    var price: String = ""
    //估价
    var pvalue: String = ""
    //优惠额度
    var pdiscount: String = ""
    
    //商家名
    var businessName: String = ""
    //使用期限
    var useTime: String = ""
    //使用门槛
    var useLimit: String = ""
    var ln: CGFloat = 0
    
    //用户名（卖方）
    var sellerName: String = "123"
    //用户头像（卖方）
    var sellerPic: String = "logo.png"
    
    
    var sellerGender: String = "♂"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //设置导航栏
        //self.navigationController?.isNavigationBarHidden = false
        self.title = ""
        //self.navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        //self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
        //self.view.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        
        
        //用户头像
        //let SellerImage = UIImage.
        
        //返回button
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(Details.backToList))
        self.navigationItem.leftBarButtonItem = leftBarBtn
        //self.navigationItem.backBarButtonItem = leftBarBtn
        //leftBarBtn.image = UIImage.
        leftBarBtn.tintColor = UIColor.white
        
        getDetail()
        
        let topheight = UIApplication.shared.statusBarFrame.height + (self.navigationController?.navigationBar.frame.height)!
        let sview = UIScrollView()
        sview.frame = CGRect(x: 0, y: -topheight, width: self.view.bounds.width, height: self.view.bounds.height + topheight)
        //sview.frame = self.view.bounds
        //view4.contentOffset = CGPoint(x: 0, y: 590)
        //view4.contentInset = UIEdgeInsets(top: 500, left: 0, bottom: -500, right: 0)
        sview.contentSize = CGSize(width: self.view.bounds.width, height: 740 + 20 * ln)
        //(frame: CGRect(x: 0,y: 590,width: self.view.bounds.width,height: 300))
        sview.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        sview.isPagingEnabled = true
        //显示竖直滚动条
        sview.showsVerticalScrollIndicator = true
        sview.scrollsToTop = true

        view.addSubview(sview)
        
        //优惠券图片
        
        /*
        let couponPicDefault = UIImageView(image:UIImage(named: "clear"))
        couponPicDefault.frame = CGRect(x:0, y:0, width:self.view.bounds.width
            , height:350)
        sview.addSubview(couponPicDefault)
        */
        
        let couponPic = UIImageView(image: self.img)
        couponPic.frame = CGRect(x:0, y: 0, width:self.view.bounds.width
            , height:350)
        sview.addSubview(couponPic)
        
        let couponClear = UIImageView(image:UIImage(named: "clear"))
        couponClear.frame = CGRect(x:0, y:0, width:self.view.bounds.width
            , height:350)
        sview.addSubview(couponClear)
        
        let view1 = UIView(frame: CGRect(x: 0,y: 350,width: self.view.bounds.width,height: 100))
        view1.backgroundColor = UIColor.white
        sview.addSubview(view1)
        
        
        
        
        //商品名
        let productName = UILabel(frame: CGRect(x: 20, y: 355, width: 200, height: 30))
        productName.textColor = UIColor.darkGray
        productName.text = self.productName
        productName.font = UIFont.systemFont(ofSize: 18)
        sview.addSubview(productName)
        
        //价格
        let priceOfProduct = UILabel(frame: CGRect(x: 20, y: 390, width: 200, height: 30))
        priceOfProduct.textColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        priceOfProduct.text = "¥" + self.price
        priceOfProduct.font = UIFont.systemFont(ofSize: 36)
        sview.addSubview(priceOfProduct)
        
        //估值
        let valueOfProduct = UILabel(frame: CGRect(x: 20, y: 420, width: 200, height: 30))
        //let valueOfProduct = UILabel(frame: CGRect(origin: CGPoint(x: 20, y: 380), size: CGSize(width: 110, height: 60)))
        valueOfProduct.textColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 0.6)
        valueOfProduct.text = "估值 ¥" + self.pvalue
        //valueOfProduct.textAlignment = NSTextAlignment.center
        valueOfProduct.font = UIFont.systemFont(ofSize: 14)
        sview.addSubview(valueOfProduct)
        
        let view2 = UIView(frame: CGRect(x: 0,y: 460,width: self.view.bounds.width,height: 35))
        view2.backgroundColor = UIColor.white
        sview.addSubview(view2)
        
        //优惠额度
        let productDiscount = UILabel(frame: CGRect(x: 20, y: 463, width: self.view.bounds.width - 40, height: 30))
        productDiscount.textColor = UIColor.darkGray
        productDiscount.text = "优惠额度：" + self.pdiscount
        productDiscount.font = UIFont.systemFont(ofSize: 16)
        sview.addSubview(productDiscount)
        
        let view3 = UIView(frame: CGRect(x: 0,y: 505,width: self.view.bounds.width,height: 100))
        view3.backgroundColor = UIColor.white
        sview.addSubview(view3)
        
        //商家名
        let sname = UILabel(frame: CGRect(x: 20, y: 508, width: 200, height: 30))
        sname.textColor = UIColor.darkGray
        sname.text = "商家：" + self.businessName
        sname.font = UIFont.systemFont(ofSize: 16)
        sview.addSubview(sname)
        
        let line1 = UIView(frame: CGRect(x: 20,y: 538,width: self.view.bounds.width - 40,height: 1))
        line1.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        sview.addSubview(line1)
        
        
        
        //卖家名
        let username = UILabel(frame: CGRect(x: 20, y: 540, width: self.view.bounds.width - 40, height: 30))
        username.textColor = UIColor.darkGray
        username.text = "卖家：" + self.sellerName
        username.font = UIFont.systemFont(ofSize: 16)
        sview.addSubview(username)
        
     
        
        
        let sellerPhoto = UIImageView(image: self.img2)
        sellerPhoto.frame = CGRect(x:self.view.bounds.width - 65, y:542, width:25
            , height:25)
        sview.addSubview(sellerPhoto)
        
 
        let rightArrow = UIImageView(image:UIImage(named: "rightArrow"))
        rightArrow.frame = CGRect(x:self.view.bounds.width - 33, y:544, width:10
            , height:20)
        sview.addSubview(rightArrow)
        
        
        let click = UIButton(type: .system)
        click.frame = CGRect(x:0, y:540, width:self.view.bounds.width, height:30)
        click.setTitle("", for: UIControlState())
       // click.setTitleColor(UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 0.6),for: UIControlState()) //普通状态下文字的颜色
        click.addTarget(self, action: #selector(Details.getSellerInfo), for: .touchUpInside)
        
        sview.addSubview(click)
        
        
        let line2 = UIView(frame: CGRect(x: 20,y: 570,width: self.view.bounds.width - 40,height: 1))
        line2.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        sview.addSubview(line2)
        
        

        //使用期限
        let validTime = UILabel(frame: CGRect(x: 20, y: 573, width: self.view.bounds.width - 40, height: 30))
        validTime.textColor = UIColor.darkGray
        validTime.text = "使用期限：" + self.useTime
        validTime.font = UIFont.systemFont(ofSize: 16)
        sview.addSubview(validTime)
        
        
        let view4 = UIView(frame: CGRect(x: 0,y: 615,width: self.view.bounds.width,height: 30 + 30 * ln))
        view4.backgroundColor = UIColor.white
        sview.addSubview(view4)

        
        //使用门槛
        let useCondition = UILabel(frame: CGRect(x: 20, y: 618, width: 200, height: 30 + 30 * ln))
        useCondition.textColor = UIColor.darkGray
        useCondition.numberOfLines = 0
        useCondition.text = "使用门槛：" + self.useLimit
        //useCondition.font = UIFont.systemFont(ofSize: 15)
        
        //通过富文本来设置行间距
        let paraph = NSMutableParagraphStyle()
        //将行间距设置为28
        paraph.lineSpacing = 7
        //样式属性集合
        let attributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 16),
                          NSParagraphStyleAttributeName: paraph]
        useCondition.attributedText = NSAttributedString(string: useCondition.text!, attributes: attributes)
        
        sview.addSubview(useCondition)
        
        
      /*
        
        //真的详细信息
        let imageView = UIImageView(image:UIImage(named: "logo"))
        imageView.frame = CGRect(x:30, y:300, width:60, height:60)
        //动作
        imageView.isUserInteractionEnabled = true
        //添加tapGuestureRecognizer手势
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(Details.tapHandler))
        imageView.addGestureRecognizer(tapGR)
        
        
        self.view.addSubview(imageView)

        */
        
        
         //关注button
        let interestBtn = UIButton(type: .system)
        
        interestBtn.addTarget(self, action: #selector(Details.attention), for: .touchUpInside)

        interestBtn.frame = CGRect(x:0, y: self.view.bounds.height - 48 , width: self.view.bounds.width / 2, height:48)
        interestBtn.setTitle("关注", for: UIControlState())
        interestBtn.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        interestBtn.setTitleColor(UIColor.white,for: UIControlState()) //普通状态下文字的颜色
        interestBtn.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        self.view.addSubview(interestBtn)
        
        //购买button
        let buyBtn = UIButton(type: .system)
        buyBtn.frame = CGRect(x:self.view.bounds.width / 2, y: self.view.bounds.height - 48, width: self.view.bounds.width / 2, height:48)
        
        buyBtn.addTarget(self, action: #selector(Details.openOrderConfirmVC), for: .touchUpInside)
        
        buyBtn.setTitle("购买", for: UIControlState())
        buyBtn.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        buyBtn.setTitleColor(UIColor.white,for: UIControlState()) //普通状态下文字的颜色
        buyBtn.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        self.view.addSubview(buyBtn)
        
        
       

        
        
    }
    
    func getDetail() {


 
        //(1）设置请求路径
       // let url:NSURL = NSURL(string:"http://192.168.204.83:1080/post_couponDetailForAndroid")!//不需要传递参数
        let url:NSURL = NSURL(string: URLString + "/post_couponDetailForAndroid")!//不需要传递参数
        
        //(2) 创建请求对象
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL) //默认为get请求
        request.timeoutInterval = 5.0 //设置请求超时为5秒
        request.httpMethod = "POST"  //设置请求方法
        
        //设置请求体
        let param:NSString = NSString(format:"couponID=%@",self.cpId)
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
                
                //coupon-couponid 优惠券id
                let couponid = json["coupon"][0]["couponid"].string
           
                
                //coupon-brandid_id 商家名
                let brandid = json["coupon"][0]["brandid_id"].int
                let brandname = json["brand"][0]["name"].string
                //coupon-catid_id 商品类别（ui没有）
                let catid = json["coupon"][0]["catid_id"].int
                //coupon-listprice 用户定价
                let listPrice = json["coupon"][0]["listprice"].string
                //coupon-value 系统估价
                let value = json["coupon"][0]["value"].string
                //coupon-product 商品名
                let product = json["coupon"][0]["product"].string
                //coupon-discount 优惠额度
                let discount = json["coupon"][0]["discount"].string
                //coupon-stat 是否上架
                let stat = json["coupon"][0]["stat"].string
                //coupon-pic 商品图片
                let pic = json["coupon"][0]["pic"].string
                //coupon-expiredtime 使用期限
                let expiredtime = json["coupon"][0]["expiredtime"].string
                //limit-content 使用门槛
                //解析字段内的数组
                let limits = json["limit"].arrayValue
                
                if (limits.description != "") {
                 //   print(limits.description)
                    var i = 1
                    for item in limits {
                     //   print(item.description)
                        let type = item["content"].stringValue
                        if (type != "") {
                       //     print("content:\(type)")
                            self.useLimit = self.useLimit + "\n\(i)、\(type)"
                            i = i + 1
                            self.ln = self.ln + 1
                        }
                        
                        
                    }
                }
 
                
      

                //seller-id 卖家id
                let sellerid = json["seller"][0]["id"].string
                //seller-nickname 卖家名
                let sellernickname = json["seller"][0]["nickname"].string
                //seller-avatar 卖家头像
                let selleravatar = json["seller"][0]["avatar"].string
                //seller-gender 卖家性别
                let sellersex = json["seller"][0]["gender"].string
               
             
         
                
                
                if(error != nil) {
                    print(error!)
                    
                } else if (couponid != nil) {
                    
                    print("商品编号:", couponid!)
                    print("商品类别:", catid!)
                    if(listPrice != nil ) {
                        print("用户定价:", listPrice!)
                        self.price = listPrice!
                    }
                    if(value != nil) {
                        print("估值:", value!)
                         self.pvalue = value!
                    }
                    if(product != nil) {
                        print("商品名:", product!)
                        self.productName = product!
                    }else {
                        self.productName = "默认商品名"
                    }
                    if(brandid != nil) {
                        print("商家名:", brandname!)
                      //  self.businessName = brandid!.description
                        self.businessName = brandname!
                    }
                    if(discount != nil) {
                        print("优惠额度:", discount!)
                        self.pdiscount = discount!
                    }
                    print("是否上架:", stat!)
                    if(expiredtime != nil){
                        print("使用期限:", expiredtime!)
                        self.useTime = expiredtime!
                    }
                    if(pic != nil){
                        print("商品图片:", pic!)
                        self.productPic = URLString + "/" + pic!
                        
                        let url = URL(string: self.productPic)
                        //从网络获取数据流
                        let data = try! Data(contentsOf: url!)
                        //通过数据流初始化图片
                        self.img = UIImage(data: data)
                      //  let imageView = UIImageView(image:newImage);
                    }
                    if(sellernickname != nil ){
                        print("卖家名：", sellernickname!)
                        self.sellerName = sellernickname!
                    }
                    if(selleravatar != nil){
                        print("卖家头像：", selleravatar!)
                        self.sellerPic = URLString + "/static/" + selleravatar!
                        let url = URL(string: self.sellerPic)
                        let data = try! Data(contentsOf: url!)
                        self.img2 = UIImage(data: data)
                    
                    }
                    if(sellerid != nil ){
                        print("卖家id：", sellerid!)
                        self.seller_id = sellerid!
                    }
                    if(sellersex != nil ){
                        print("卖家性别：", sellersex!)
                        if(sellersex == "男") {
                            self.sellerGender = "♂"
                        }else if(sellersex == "女") {
                            self.sellerGender = "♀"
                        }
                    }
  
                    
                }
 
                
            }
            
            semaphore.signal()
            
            } as URLSessionTask
        
        
        
        dataTask.resume()
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        print("执行完毕")
        
        
    }
    
    
    
    //返回button action
    func backToList(){
        self.navigationController?.navigationBar.isTranslucent = false

        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
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
    
    func attention() {
        
        var tz: String!
        tz = String("nil")
        
        
        //print(password)
        
        //(1）设置请求路径
        let url:NSURL = NSURL(string: URLString + "/post_likeCoupon")!//不需要传递参数
        
        //(2) 创建请求对象
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL) //默认为get请求
        request.timeoutInterval = 5.0 //设置请求超时为5秒
        request.httpMethod = "POST"  //设置请求方法
        
        //设置请求体
        let param:NSString = NSString(format:"couponID=%@&userID=%@",self.cpId, user_id!)
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
                
                //let errno = json["errno"].string
                let result = json["result"].string
                //let userid = json["userid"].string
                
                if(error != nil) {
                    print(error!)
                    
                } else if (result != nil) {
                    
                    print("result:", result!)
                    //print("userid:", userid!)
                    
                    tz = result
                    
                    
                    //print(tz)
                }
                
            }
            
            semaphore.signal()
            
            } as URLSessionTask
        
        
        
        dataTask.resume()
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        print("执行完毕")
        
        if(tz == "success"){
            self.promptWindow(ms: "关注成功")
        
        } else if(tz == "already like"){
            self.promptWindow(ms: "您已关注该优惠券")
        } else {
            self.promptWindow(ms: "关注失败")
        }
    }
    
    
    func getSellerInfo(){
       
        if(seller_id != nil) {
            let VC = SellersInfo()
            delegate2 = VC as pass_parameter2
            delegate2?.parameter2(controller: self, u_id: seller_id!, u_name: sellerName, u_pic: img2!, u_gender: sellerGender)
            self.navigationController?.pushViewController(VC, animated: true)
        }else {
            promptWindow(ms: "无法查看卖家信息")
        }
        
      }

    
    func openOrderConfirmVC() {
        let VC = OrderConfirm()
        delegate3 = VC as pass_parameter3
        delegate3?.parameter3(controller: self, user_id: user_id!, coupon_id: cpId, p_name: productName, p_discount: pdiscount, p_uselimit: useLimit, p_ln: ln, p_price: price, p_value: pvalue, p_usetime: useTime)
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func couponid(id: String) {
        self.cpId = id
    }
    
}

