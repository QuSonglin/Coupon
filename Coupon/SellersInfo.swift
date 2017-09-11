//
//  SellersInfo.swift
//  Coupon
//


//通过在Details中点击用户头像，可以浏览出售者的个人信息，包括用户名、头像、性别、已出售的优惠券、正在出售的优惠券


//  Created by macbook on 17/7/14.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit

class SellersInfo: UIViewController, pass_parameter2, UITableViewDelegate, UITableViewDataSource{
    
    
    var seller_id: String?
  //  var sellerName: String = "test"
    var sellerName: String?
  //  var sellerGender: String = "男"
    var sellerGender: String?
   // var sellerPic: String?
    var img = UIImage()
    
    var color_selling = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
    var color_sold = UIColor.lightGray
    
    var hide_selling:Bool = false
    var hide_sold:Bool = true
    
    //优惠券列表
    var couponList: UITableView?
    var Listinfo: Dictionary<Int, [String]> = [:]
    var allnames:Dictionary<Int, [String]> = [:]
    
    let sview = UIScrollView()
    let selling = UILabel()
    let sold = UILabel()
    let line_selling = UIView()
    let line_sold = UIView()
    
    //监视器


    var change:Int = 2
    {

        willSet{
            if change == 2{
                self.sold.textColor = self.color_sold
                self.selling.textColor = self.color_selling
                self.line_sold.isHidden = self.hide_sold
                self.line_selling.isHidden = self.hide_selling
                print("执行change为2")
                
                
                
                self.couponList = UITableView(frame: CGRect(x: 50, y: 290, width: Int(self.view.bounds.width - 100), height: 180 * (Listinfo.count)))
                self.couponList!.delegate = self
                self.couponList!.dataSource = self
                
                //创建一个重用的单元格
                self.couponList!.register(UITableViewCell.self, forCellReuseIdentifier: "swiftcell")
                self.couponList?.rowHeight = 180
                sview.addSubview(self.couponList!)
                
           //     couponList?.reloadData()
                getCouponDetail(condition: "onSale")
                /*
                sview.addSubview(selling)
                sview.addSubview(sold)
                sview.addSubview(line_sold)
                sview.addSubview(line_selling)
                sview.addSubview(couponList!)
 */
            }
        }
        didSet{
            if change == 0 {
                self.color_selling = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
                self.color_sold = UIColor.lightGray
                self.hide_selling = false
                self.hide_sold = true
                self.sold.textColor = self.color_sold
                self.selling.textColor = self.color_selling
                self.line_sold.isHidden = self.hide_sold
                self.line_selling.isHidden = self.hide_selling
                print("执行change为0")
                
              //  self.couponList?.isHidden = true
                getCouponDetail(condition: "onSale")
                
                
              
            //    couponList?.reloadData()
                
                
                
            }
            if change == 1{
                self.color_sold = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
                self.color_selling = UIColor.lightGray
                self.hide_sold = false
                self.hide_selling = true
                
                self.sold.textColor = self.color_sold
                self.selling.textColor = self.color_selling
                self.line_sold.isHidden = self.hide_sold
                self.line_selling.isHidden = self.hide_selling
                print("执行change为1")
                getCouponDetail(condition: "sold")
          //      couponList?.reloadData()
                
                
                
            }
        }
    }
    
    
   // var listHeight:CGFloat = 600
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //设置导航栏
        self.title = "卖家信息"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.view.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        
        //sview = UIScrollView()
        sview.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        sview.contentSize = CGSize(width: self.view.bounds.width, height: 2000)
        sview.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        sview.isPagingEnabled = true
        sview.showsVerticalScrollIndicator = true
        sview.scrollsToTop = true
        view.addSubview(sview)
        
        
        
        
        //返回button
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(SellersInfo.backToDetails))
        self.navigationItem.leftBarButtonItem = leftBarBtn
        //self.navigationItem.backBarButtonItem = leftBarBtn
        //leftBarBtn.image = UIImage.
        leftBarBtn.tintColor = UIColor.white
        
        
        
        let view1 = UIView(frame: CGRect(x: 0,y: 0,width: 420,height: 250))
        view1.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        sview.addSubview(view1)
        

        
        //创建图片视图
        let imageView = UIImageView(image: self.img)
        imageView.frame.size = CGSize(width: 100, height: 100)
        imageView.layer.masksToBounds = true
        imageView.center = CGPoint(x: self.view.bounds.width / 2, y: 130)
        imageView.layer.cornerRadius = 50
        sview.addSubview(imageView)
        
        
        
        //卖家名字
        let sname = UILabel()
        sname.frame.size = CGSize(width: self.view.bounds.width - 40, height: 30)
        sname.textColor = UIColor.white
        sname.text = self.sellerName!
       // sname.text = self.sellerName
        sname.textAlignment = NSTextAlignment.center
        sname.center = CGPoint(x: self.view.bounds.width / 2, y: 205)
        sname.font = UIFont.systemFont(ofSize: 18)
        sview.addSubview(sname)
        
        let ssex = UILabel()
        ssex.frame.size = CGSize(width: self.view.bounds.width - 40, height: 30)
        ssex.textColor = UIColor.white
        ssex.text = self.sellerGender!
       // ssex.text = self.sellerGender
        ssex.textAlignment = NSTextAlignment.center
        ssex.center = CGPoint(x: self.view.bounds.width / 2, y: 230)
        ssex.font = UIFont.systemFont(ofSize: 16)
        sview.addSubview(ssex)
        
        /*
         let view2 = UIView(frame: CGRect(x: 0,y: 266,width: 420,height: 200))
         view2.backgroundColor = UIColor.white
         sview.addSubview(view2)
         */
        
        
        let view2 = UIView(frame: CGRect(x: 0,y: 250,width: self.view.bounds.width, height: 40))
        view2.backgroundColor = UIColor.white
        sview.addSubview(view2)
        
        let click_selling = UIButton(type: .system)
        click_selling.frame = CGRect(x:0, y:250, width:self.view.bounds.width / 2, height:40)
        click_selling.setTitle("", for: UIControlState())
        click_selling.addTarget(self, action: #selector(SellersInfo.getSellingDetail), for: .touchUpInside)
        sview.addSubview(click_selling)
        
        let click_sold = UIButton(type: .system)
        click_sold.frame = CGRect(x:self.view.bounds.width / 2, y:250, width:self.view.bounds.width / 2, height:40)
        click_sold.setTitle("", for: UIControlState())
        click_sold.addTarget(self, action: #selector(SellersInfo.getSoldDetail), for: .touchUpInside)
        sview.addSubview(click_sold)
        
        let line1 = UIView(frame: CGRect(x: self.view.bounds.width / 2, y: 255,width: 1,height: 30))
        line1.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        sview.addSubview(line1)
        
        self.change = 2
        
        
        line_selling.frame = CGRect(x: 10,y: 288,width: self.view.bounds.width / 2 - 20,height: 2)
        line_selling.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        //  line_selling.isHidden = self.hide_selling
        sview.addSubview(line_selling)
        
        line_sold.frame = CGRect(x: self.view.bounds.width / 2 + 10,y: 288,width: self.view.bounds.width / 2 - 20,height: 2)
        line_sold.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        //  line_sold.isHidden = self.hide_sold
        sview.addSubview(line_sold)
        
        
        selling.frame.size = CGSize(width: self.view.bounds.width / 2, height: 30)
        selling.center = CGPoint(x: self.view.bounds.width / 4, y: 270)
        //  selling.textColor = self.color_selling
        selling.text = "正在出售"
        selling.textAlignment = NSTextAlignment.center
        selling.font = UIFont.systemFont(ofSize: 16)
        sview.addSubview(selling)
        
        sold.frame.size = CGSize(width: self.view.bounds.width / 2, height: 30)
        sold.center = CGPoint(x: self.view.bounds.width / 4 * 3, y: 270)
        //  sold.textColor = self.color_sold
        sold.textAlignment = NSTextAlignment.center
        sold.text = "已经售出"
        sold.font = UIFont.systemFont(ofSize: 16)
        sview.addSubview(sold)

        
        
        
        
        //创建表视图
        //测试用
        /*
        self.Listinfo = [
            
           
            0:[String]([
                "无",
                "无",
                "无",
                "无",
                "无"
                ])
        ]
        
        print(self.Listinfo)
        */
        
        
        
        
        
 // getCouponDetail(condition: "onSale")
        


        
        
    }
    
    
    // MARK: - tableView Delegate && tableView DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(Listinfo.count)
        return (Listinfo.count)
    }
    
    ///创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify:String = "SwiftCell"
        let cell = CouponCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identify)
      //  cell.frame = CGRect(x: 0, y: 15, width: self.view.bounds.width, height: 170)
     //   cell.frame.size = CGSize(width: self.view.bounds.width, height: 180)
        let secno = indexPath.row
        let data = self.Listinfo[secno]
        cell.extiredtime_label?.text = "有效期至：" + (data?[4])!
        cell.pdiscount_label?.text = data?[0]
        cell.price_label?.text = "¥" + (data?[2])!
        cell.productName_label?.text = data?[1]
        cell.pvalue_label?.text = "估值:¥" + (data?[3])!
        cell.yhqbg?.image = UIImage(named: "yhq.png")
        
        cell.isHighlighted = false
        
        cell.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        

        //同一形式的单元格重复使用，在声明时已注册
        return cell
    }
    

    //触发监视器
    
    
    
    
    func getSellingDetail() {
        self.change = 0
        
    }
    func getSoldDetail() {
        self.change = 1
    }
    
   
    
    
    func getCouponDetail(condition: String) {

        
        //(1）设置请求路径
        let url:NSURL = NSURL(string:"http://192.168.204.83:1080/post_sellerInformation")!//不需要传递参数
     //   let url:NSURL = NSURL(string:"http://192.168.207.221:8000/post_sellerInformation")!//不需要传递参数
        //(2) 创建请求对象
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL) //默认为get请求
        request.timeoutInterval = 5.0 //设置请求超时为5秒
        request.httpMethod = "POST"  //设置请求方法
        
        //设置请求体
      //  let param:NSString = NSString(format:"sellerID=%@",self.seller_id!)
        let param:NSString = NSString(format:"sellerID=%@",self.seller_id!)

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
                
                
                let error = json["error"].string
            
              
                
                //解析字段内的数组
                let onsaleList = json[condition].arrayValue
                
                if (onsaleList.description != "") {
                    //   print(limits.description)
                    var i = 0
                    
                    self.Listinfo.removeAll()
                    
                    for item in onsaleList {
                        //   print(item.description)
                        let type1 = item["couponid"].stringValue
                        print(type1)
                        let type2 = item["product"].stringValue
                        let type3 = item["listprice"].stringValue
                        let type4 = item["value"].stringValue
                        let type5 = item["expiredtime"].stringValue
                        let type6 = item["discount"].stringValue
                        self.Listinfo.updateValue([String]([type6, type2, type3, type4, type5]), forKey: i)
                 
                        i = i + 1
                    }
                }
                

                if(error != nil) {
                    print(error!)
                    
                }

            }
            
            semaphore.signal()
            
            } as URLSessionTask
        
        
        
        dataTask.resume()
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        print("执行完毕")
        
    
 
        self.couponList?.frame = CGRect(x: 50, y: 290, width: Int(self.view.bounds.width - 100), height: 180 * (Listinfo.count))
        self.couponList?.reloadData()

    }
    

    
    //返回button action
    func backToDetails(){
   
        self.navigationController?.popViewController(animated: true)
     
    }
    
    func parameter2(controller: Details, u_id: String, u_name: String, u_pic: UIImage, u_gender: String) {
        self.seller_id = u_id
        self.sellerName = u_name
        self.img = u_pic
        self.sellerGender = u_gender
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

