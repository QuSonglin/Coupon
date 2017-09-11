//
//  haveSold.swift
//  Coupon
//
//  Created by macbook on 2017/7/18.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit

class haveSold: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var userID = UID
    //优惠券列表
    var couponList: UITableView?
    var Listinfo: Dictionary<Int, [String]> = [:]
    var allnames:Dictionary<Int, [String]> = [:]
    
    let sview = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(myFocus.backToMine))
        self.navigationItem.leftBarButtonItem = leftBarBtn
        leftBarBtn.tintColor = UIColor.white
        
        self.title = "我卖出的优惠券"
        
        sview.frame=CGRect(x:0,y:0,width:self.view.bounds.width,height:self.view.bounds.height)
        sview.contentSize=CGSize(width:self.view.bounds.width,height:2000)
        sview.isPagingEnabled=true
        sview.showsVerticalScrollIndicator=true
        sview.scrollsToTop=true
        view.addSubview(sview)
        
        self.couponList = UITableView(frame: CGRect(x: 0, y: 70, width: Int(self.view.bounds.width), height: 180 * (Listinfo.count)))
        self.couponList!.delegate = self
        self.couponList!.dataSource = self
        
        //创建一个重用的单元格
        self.couponList!.register(UITableViewCell.self, forCellReuseIdentifier: "swiftcell")
        self.couponList?.rowHeight = 180
        sview.addSubview(self.couponList!)
        
        self.getHaveSold()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(Listinfo.count)
        return (Listinfo.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier="swiftCell"
        let cell=cellStyle(style:UITableViewCellStyle.subtitle,reuseIdentifier:identifier)
        
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
        
        return cell
    }
    
    
    func backToMine(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func getHaveSold(){
        //(1）设置请求路径
        let url:NSURL = NSURL(string: URLString + "/post_getSoldList")!//不需要传递参数
        
        //(2) 创建请求对象
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL) //默认为get请求
        request.timeoutInterval = 5.0 //设置请求超时为5秒
        request.httpMethod = "POST"  //设置请求方法
        
        //设置请求体
        let param:NSString = NSString(format:"userID=%@",self.userID!)
        
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
                
                print(json)
                //解析字段内的数组
                let soldList = json["soldList"].arrayValue
                
                if (soldList.description != "") {
                    //   print(limits.description)
                    var i = 0
                    
                    self.Listinfo.removeAll()
                    
                    for item in soldList {
                        print(item.description)
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
        
        
        self.couponList?.frame = CGRect(x: 0, y: 70, width: Int(self.view.bounds.width), height: 180 * (Listinfo.count))
        self.couponList?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
