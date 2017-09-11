//
//  ValuationViewView.swift
//  Coupon
//
//  Created by 屠明暄 on 2017/8/6.
//  Copyright © 2017年 iss. All rights reserved.
//

import UIKit

class ValuationViewView: UIViewController, CouponInfo {
    
    var product: String?
    var brand: String?
    var discount: String?
    var category: String?
    var expiredtime: String?
    var limit: [String]?
    
    var valuationprice: Float = 100.00
    var listprice: UITextField?
    var state: String?
    var pic: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "估值展示"
        self.view.backgroundColor = UIColor.white
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(backtoPrevious))
        leftBarBtn.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = leftBarBtn
        
        let prey = (self.navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height
        let viewwidth = self.view.bounds.width
        let viewheight = self.view.bounds.height
        //valuationview
        let valuationview = UIView(frame: CGRect(x: 0, y: prey, width: viewwidth, height: viewheight/6))
        let titlelabel = UILabel(frame: CGRect(x: viewwidth/20 , y: valuationview.frame.height/4, width: viewwidth/2, height: valuationview.frame.height/4))
        titlelabel.textColor = UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1)
        titlelabel.text = "优惠券预估价值为"
        let pricelabel = UILabel(frame: CGRect(x: viewwidth/20, y: valuationview.frame.height/3, width: viewwidth/2, height: valuationview.frame.height/3*2))
        pricelabel.text = String(valuationprice)
        pricelabel.font = UIFont.systemFont(ofSize: 50)
        pricelabel.textColor = UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1)
        //separation
        let sep1 = UIView(frame: CGRect(x: 0, y: valuationview.frame.height-1, width: viewwidth, height: 1))
        sep1.backgroundColor = UIColor.lightGray
        valuationview.addSubview(titlelabel)
        valuationview.addSubview(pricelabel)
        valuationview.addSubview(sep1)
        
        //price
        let priceview = UIView( frame: CGRect(x: 0, y: prey + viewheight/6, width: viewwidth, height: viewheight/18))
        let listpricelabel = UILabel( frame: CGRect(x: viewwidth/20, y: priceview.frame.height/4, width: viewwidth/20*3, height: priceview.frame.height/2))
        listpricelabel.text = "价格："
        listprice = UITextField(frame: CGRect(x: viewwidth/5, y: priceview.frame.height/4, width: viewwidth/20*11, height: priceview.frame.height/2))
        listprice?.isUserInteractionEnabled = true
        listprice?.placeholder = "请输入优惠券价格"
        let setvaluation: UIButton =  UIButton(type: .system)
        setvaluation.frame = CGRect(x: viewwidth/4*3, y: priceview.frame.height/4, width: viewwidth/5, height: priceview.frame.height/2)
        setvaluation.setTitle("采用估值", for: .normal)
        setvaluation.setTitleColor( UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1),for: UIControlState())
        //separation
        let sep2 = UIView(frame: CGRect(x: 0, y: priceview.frame.height-1, width: viewwidth, height: 1))
        sep2.backgroundColor = UIColor.lightGray
        priceview.addSubview(listpricelabel)
        priceview.addSubview(listprice!)
        priceview.addSubview(setvaluation)
        priceview.addSubview(sep2)
        
        //portrait and product
        let productview = UIView(frame: CGRect(x: 0, y: prey + viewheight/9*2, width: viewwidth, height: viewheight/9))
        let couponimg = UIImageView(frame: CGRect(x: productview.frame.width/20, y: productview.frame.height/10, width: productview.frame.height/5*4, height: productview.frame.height/5*4))
        couponimg.image = UIImage( named: "coffee")
        let couponname = UILabel(frame: CGRect(x: productview.frame.height + productview.frame.width/10, y: 0, width: viewwidth/5*3 , height: productview.frame.height))
        couponname.font = UIFont.systemFont(ofSize: 20)
        couponname.text = product!
        //separation
        let sep3 = UIView(frame: CGRect(x: 0, y: productview.frame.height-1, width: viewwidth, height: 1))
        sep3.backgroundColor = UIColor.lightGray
        productview.addSubview(couponimg)
        productview.addSubview(couponname)
        productview.addSubview(sep3)
        
        //discount
        let discountview = UIView(frame: CGRect(x: 0, y: prey + viewheight/18*6, width: viewwidth, height: viewheight/18))
        let discounttitle = UILabel(frame: CGRect(x: viewwidth/20, y: 0, width: viewwidth/4, height: discountview.frame.height))
        discounttitle.text = "优惠额度："
        let discoutlabel = UILabel(frame: CGRect(x: viewwidth/10*3, y: 0, width: viewwidth/20*12, height: discountview.frame.height))
        discoutlabel.text = discount!
        discoutlabel.textAlignment = .right
        discoutlabel.textColor = UIColor.lightGray
        //separation
        let sep4 = UIView(frame: CGRect(x: 0, y: discountview.frame.height-1, width: viewwidth, height: 1))
        sep4.backgroundColor = UIColor.lightGray
        discountview.addSubview(discounttitle)
        discountview.addSubview(discoutlabel)
        discountview.addSubview(sep4)
        
        
        //brand
        let brandview = UIView(frame: CGRect(x: 0, y: prey + viewheight/18*7, width: viewwidth, height: viewheight/18))
        let brandtitle = UILabel(frame: CGRect(x: viewwidth/20, y: 0, width: viewwidth/4, height: brandview.frame.height))
        brandtitle.text = "商家名："
        let brandlabel = UILabel(frame: CGRect(x: viewwidth/10*3, y: 0, width: viewwidth/20*12, height: brandview.frame.height))
        brandlabel.text = brand!
        brandlabel.textAlignment = .right
        brandlabel.textColor = UIColor.lightGray
        //separation
        let sep5 = UIView(frame: CGRect(x: 0, y: brandview.frame.height-1, width: viewwidth, height: 1))
        sep5.backgroundColor = UIColor.lightGray
        brandview.addSubview(brandtitle)
        brandview.addSubview(brandlabel)
        brandview.addSubview(sep5)
        
        //category
        let categoryview = UIView(frame: CGRect(x: 0, y: prey + viewheight/18*8, width: viewwidth, height: viewheight/18))
        let categorytitle = UILabel(frame: CGRect(x: viewwidth/20, y: 0, width: viewwidth/4, height: categoryview.frame.height))
        categorytitle.text = "品种："
        let categorylabel = UILabel(frame: CGRect(x: viewwidth/10*3, y: 0, width: viewwidth/20*12, height: categoryview.frame.height))
        categorylabel.text = category!
        categorylabel.textAlignment = .right
        categorylabel.textColor = UIColor.lightGray
        //separation
        let sep6 = UIView(frame: CGRect(x: 0, y: categoryview.frame.height-1, width: viewwidth, height: 1))
        sep6.backgroundColor = UIColor.lightGray
        categoryview.addSubview(categorytitle)
        categoryview.addSubview(categorylabel)
        categoryview.addSubview(sep6)
        
        //expiredtime
        let expiredtimeview = UIView(frame: CGRect(x: 0, y: prey + viewheight/18*9, width: viewwidth, height: viewheight/18))
        let expiredtimetitle = UILabel(frame: CGRect(x: viewwidth/20, y: 0, width: viewwidth/4, height: expiredtimeview.frame.height))
        expiredtimetitle.text = "过期时间："
        let expiredtimelabel = UILabel(frame: CGRect(x: viewwidth/10*3, y: 0, width: viewwidth/20*12, height: expiredtimeview.frame.height))
        expiredtimelabel.text = expiredtime!
        expiredtimelabel.textAlignment = .right
        expiredtimelabel.textColor = UIColor.lightGray
        //separation
        let sep7 = UIView(frame: CGRect(x: 0, y: expiredtimeview.frame.height-1, width: viewwidth, height: 1))
        sep7.backgroundColor = UIColor.lightGray
        expiredtimeview.addSubview(expiredtimetitle)
        expiredtimeview.addSubview(expiredtimelabel)
        expiredtimeview.addSubview(sep7)
        
        
        //store
        let storeBtn = UIButton(type: .system)
        storeBtn.tag = 0
        storeBtn.addTarget(self, action: #selector(addcoupon(sender:)), for: .touchUpInside)
        storeBtn.frame = CGRect(x:0, y: self.view.bounds.height - (self.navigationController?.navigationBar.bounds.height)! , width: self.view.bounds.width/2, height: (self.navigationController?.navigationBar.bounds.height)!)
        storeBtn.setTitle("添加到“我的”", for: UIControlState())
        storeBtn.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        storeBtn.setTitleColor(UIColor.white,for: UIControlState()) //普通状态下文字的颜色
        storeBtn.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        self.view.addSubview(storeBtn)
        //separation
        let sep8 = UIView(frame: CGRect(x: self.view.bounds.width/2, y: self.view.bounds.height - (self.navigationController?.navigationBar.bounds.height)!, width: 1, height: (self.navigationController?.navigationBar.bounds.height)!))
        sep8.backgroundColor = UIColor.white
        //putaway
        let putawayBtn = UIButton(type: .system)
        putawayBtn.tag = 1
        putawayBtn.addTarget(self, action: #selector(addcoupon(sender:)), for: .touchUpInside)
        putawayBtn.frame = CGRect(x:self.view.bounds.width/2, y: self.view.bounds.height - (self.navigationController?.navigationBar.bounds.height)! , width: self.view.bounds.width/2, height: (self.navigationController?.navigationBar.bounds.height)!)
        putawayBtn.setTitle("上架优惠券", for: UIControlState())
        putawayBtn.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        putawayBtn.setTitleColor(UIColor.white,for: UIControlState()) //普通状态下文字的颜色
        putawayBtn.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        self.view.addSubview(putawayBtn)
        
        
        
        self.view.addSubview(valuationview)
        self.view.addSubview(priceview)
        self.view.addSubview(productview)
        self.view.addSubview(discountview)
        self.view.addSubview(brandview)
        self.view.addSubview(categoryview)
        self.view.addSubview(expiredtimeview)
        self.view.addSubview(sep8)
        
        
        // Do any additional setup after loading the view.
    }
    
    func addcoupon(sender:UIButton){
        let url:NSURL = NSURL(string: URLString + "/post_addCoupon")!
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL)
        request.timeoutInterval = 5.0
        request.httpMethod = "POST"
        var param: Dictionary<String,Any>  = [:]
        if sender.tag == 0{
            param = ["userID":UID!, "brand":self.brand!,"category":self.category!,"expiredItme":self.expiredtime!,"lishPrice":self.listprice!.text!,"product":self.product!,"discount":self.discount!,"stat":"store","limit[]":self.limit!]
        }else{
            param = ["userID":UID!, "brand":self.brand!,"category":self.category!,"expiredItme":self.expiredtime!,"lishPrice":self.listprice!.text!,"product":self.product!,"discount":self.discount!,"stat":"store","limit[]":self.limit!]
        }
        request.httpBody = jsonToData(jsonDic: param)
        let session = URLSession.shared
        let semaphore = DispatchSemaphore(value: 0)
        
        let dataTask = session.dataTask(with: request as URLRequest) {(data, reponse, error) -> Void in
            if error != nil {
                print("Error:\(error!)")
            }else{
                //let str = NSString(data: data!,encoding:String.Encoding.utf8.rawValue)
                let jsons = JSON(data!)
                print(jsons)
            }
            semaphore.signal()
            }as URLSessionTask
        
        dataTask.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        
    }
    
    func jsonToData(jsonDic: Dictionary<String,Any>) ->Data?{
    
        if(!JSONSerialization.isValidJSONObject(jsonDic)) {
            print("is not a valid json object")
            return nil
        }
    
        //利用自带的json库转换成Data
        //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
        let data = try? JSONSerialization.data(withJSONObject: jsonDic, options: [])
        //Data转换成String打印
        let str = String(data:data!, encoding: String.Encoding.utf8)
        //输出json字符串
        print("Json Str:\(str!)")
        return data
    }
    
    func backtoPrevious(){
        self.navigationController!.popViewController(animated: true)
    }
    
    func couponinfo(product: String, brand: String, discount: String, category: String, expiredtime: String, limit: [String]) {
        self.discount = discount
        self.product = product
        self.brand = brand
        self.category = category
        self.expiredtime = expiredtime
        self.limit = limit
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
