//
//  myMessage.swift
//  Coupon
//
//  Created by yaowenqing on 2017/7/31.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit

class myMessage: UIViewController,UITableViewDelegate,UITableViewDataSource{


    var userID = UID
    //优惠券列表
    var messageList: UITableView?
    var Listinfo: Dictionary<Int, [String]> = [:]
    var allnames:Dictionary<Int, [String]> = [:]

    let sview = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(myFocus.backToMine))
        self.navigationItem.leftBarButtonItem = leftBarBtn
        leftBarBtn.tintColor = UIColor.white
        self.title = "我的消息"

        
        let prey = (self.navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height

        self.messageList = UITableView(frame: CGRect(x: 0, y: -prey, width: self.view.bounds.width, height: CGFloat(100 * (Listinfo.count))))
        self.messageList!.delegate = self
        self.messageList!.dataSource = self
        
        //创建一个重用的单元格
        self.messageList!.register(UITableViewCell.self, forCellReuseIdentifier: "swiftcell")
        self.messageList?.rowHeight = 100
        self.view.addSubview(self.messageList!)
        
        self.getMessage()
}
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(Listinfo.count)
        return (Listinfo.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier="swiftCell"
        let cell=messageStyle(style:UITableViewCellStyle.subtitle,reuseIdentifier:identifier)
        
        let secno = indexPath.row
        let data = self.Listinfo[secno]
  
        cell.content?.text = data?[0]
        cell.messagecat?.text = data?[1]
        cell.theTime?.text = data?[2]
     
        //cell.showImage = UIImage(named: "message.png")
        cell.clickButton?.addTarget(self, action: #selector(myMessage.getDetail), for: .touchUpInside)
        cell.isHighlighted = false
        
        cell.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        
        return cell
    }
    
    
    func backToMine(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func getMessage(){
        //(1）设置请求路径
        let url:NSURL = NSURL(string: URLString + "/post_sendMessage")!//不需要传递参数
        
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
                let messageResult = json["messageResult"].arrayValue
                
                if (messageResult.description != "") {
                    //   print(limits.description)
                    var i = 0
                    
                    self.Listinfo.removeAll()
                    
                    for item in messageResult {
                        print(item.description)
                
                        let type1 = item["content"].stringValue
                        let type2 = item["messagecat"].stringValue
                        let type3 = item["time"].stringValue
 
                        self.Listinfo.updateValue([String]([type1, type2, type3]), forKey: i)
                        
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
        
        
        self.messageList?.frame = CGRect(x: 0, y: 70, width: Int(self.view.bounds.width), height: 100 * (Listinfo.count))
        self.messageList?.reloadData()
    }
    
    func getDetail(){
        let VC=couponDetail()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}










/*


class myMessage: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var mainTable:UITableView?
    var mainArray:NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(myMessage.backToMine))
        self.navigationItem.leftBarButtonItem = leftBarBtn
        leftBarBtn.tintColor = UIColor.white
        
        self.title = "消息"
        
        self.SetUpTable()
        self.loadDataSource()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier="mainCell"
        let cell=messageStyle(style:UITableViewCellStyle.subtitle,reuseIdentifier:identifier)
        var dic=Dictionary<String,String>()
        dic["name"]=mainArray![indexPath.row]as?String
        
        print(dic)
        
        cell.setValueForCell(dic: dic as NSDictionary)
        
        return cell
    }
    
    func loadDataSource(){
        mainArray=NSMutableArray.init(array:["0","1","2","3","4"])
        self.mainTable?.reloadData()
    }
    
    func SetUpTable(){
        mainTable = UITableView.init(frame:CGRect(x:0,y:0,width:self.view.bounds.width,height:self.view.bounds.height),style:UITableViewStyle.grouped)
        mainTable!.delegate=self
        mainTable!.dataSource=self
        mainTable!.backgroundColor=UIColor(red:235/255,green:235/255,blue:235/255,alpha:1)
        self.view.addSubview(mainTable!)
    }
    
    func backToMine(){
        self.navigationController?.popViewController(animated: true)
    }
    
}

 */
