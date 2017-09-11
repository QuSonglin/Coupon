//
//  KindSingleViewController.swift
//  hello
//
//  Created by niangniang on 2017/7/20.
//  Copyright © 2017年 niangniang. All rights reserved.
//

import UIKit

class KindSingleViewController: UIViewController,kindparameter, UITableViewDelegate, UITableViewDataSource {
    func kindname(controller: KindViewController, kind: Int) {
        kindid = kind
    }
    var kindid: Int?
    var screenwidth = UIScreen.main.bounds.width
    var coupontable: UITableView?
    var couponarry = [coupondic]
    
    var gotodetail: Couponid?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(kindid!)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1)
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(backtoPrevious))
        leftBarBtn.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = leftBarBtn
        
        
        self.gettableinfo(kind: String(kindid!))
        let tablecount = CGFloat(couponarry.count)//tableinfo?.count
        let rowheight: CGFloat = UIScreen.main.bounds.height/6
        coupontable = UITableView.init( frame: CGRect(x:0, y: 0, width: screenwidth , height: rowheight*tablecount))
        self.coupontable!.delegate = self
        self.coupontable!.dataSource = self
        self.view.addSubview(coupontable!)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInTableView(tableView:UITableView) -> Int {
        return 1
    }
    //table hangshu
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = self.couponarry.count
        return data
    }
    //rowheight
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height/6
    }
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identify:String = "couponcell"
        let cell = TableViewCell(style:UITableViewCellStyle.subtitle, reuseIdentifier: identify)
        let secno = indexPath.row
        let data = self.couponarry[secno]
        if data == nil {
            promptWindow(ms: "未连接到服务器")
        }else{
            
            cell.product?.text = data?["product"]
            cell.discount?.text = data?["discount"]
            cell.expiredtime?.text = data?["expiredtime"]
            cell.listprice?.text = "$" + (data?["listprice"])!
            let picture = data?["pic"]?.replacingOccurrences(of: "\\\\", with: "")
            cell.couponimg?.image = UIImage.image(fromURL: URLString + "/static/" + picture!, placeholder: UIImage(named:"test")!){_ in
            }
            cell.border?.backgroundColor = UIColor.lightGray
            }
        return cell
    }
    //click cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = Details()
        gotodetail = VC
        gotodetail?.couponid(id: (couponarry[indexPath.row]?["couponid"]!)!)
        self.navigationController?.pushViewController(VC, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func backtoPrevious() {
        self.navigationController!.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func gettableinfo(kind: String) {
        let url:NSURL = NSURL(string: URLString + "/post_searchByCategory")!
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL)
        request.timeoutInterval = 5.0
        request.httpMethod = "POST"
        
        let param:NSString = NSString(format:"categoryID=%@", kind)
        request.httpBody = param.data(using: String.Encoding.utf8.rawValue)
        
        let session = URLSession.shared
        let semaphore = DispatchSemaphore(value: 0)

        let dataTask = session.dataTask(with: request as URLRequest) {(data, reponse, error) -> Void in
            if error != nil {
                
            }else{
                self.couponarry = []
                //let str = NSString(data: data!,encoding:String.Encoding.utf8.rawValue)
                let jsons = JSON(data!)
                let jsonscount = jsons["result"].count
                for i in 0 ..< jsonscount{
                    //self.presearchresult[i] = jsons["result"][i]["product"].string!
                    coupondic = Dictionary<String, String>()
                    for (key, subjson):(String, JSON) in jsons["result"][i]{
                        coupondic?[key] = subjson.string
                    }
                    self.couponarry.append(coupondic!)
                }
                //let str = NSString(data: data!,encoding:String.Encoding.utf8.rawValue)
                //let jsons = JSON(data!)
                //print(jsons)
            }
            semaphore.signal()
            }as URLSessionTask
        
        dataTask.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
