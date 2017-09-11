//
//  SearchResult.swift
//  hello
//
//  Created by 屠明暄 on 2017/7/30.
//  Copyright © 2017年 niangniang. All rights reserved.
//

import UIKit


var resultdic: Dictionary<String, String>?
class SearchResult: UIViewController, keyword, UITableViewDelegate, UITableViewDataSource{
    var isresult = false
    var resulttable: UITableView?
    var searchkey: String?

    var resultarry = [resultdic]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let fontarry = UIFont.familyNames
        //print(fontarry)
        self.view.backgroundColor = UIColor.white
        let view = UIImageView(frame: CGRect(x:0, y:0, width: self.view.bounds.width - 40, height: (self.navigationController?.navigationBar.bounds.height)!/3*2))
        view.image = UIImage(named: "搜索栏")
        self.navigationItem.titleView = view
        self.navigationItem.titleView?.isUserInteractionEnabled = true
        let searchtap = UITapGestureRecognizer(target: self, action: #selector( gotosearch(_:)))
        self.navigationItem.titleView?.addGestureRecognizer( searchtap)
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(gotosearch(_:)))
        leftBarBtn.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = leftBarBtn
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        //self.navigationItem.hidesBackButton = true     // Do any additional setup after loading the view.
        
        self.search(keyword: searchkey!)
        //print(self.resultarry)
        
        self.resulttable = UITableView.init(frame: CGRect(x: 0, y:0, width: self.view.bounds.width, height: self.view.bounds.height))
        self.resulttable?.delegate = self
        self.resulttable?.dataSource = self
        self.resulttable?.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        self.resulttable?.separatorColor = UIColor.gray
        self.resulttable?.rowHeight = self.view.bounds.height/8
        
        self.view.addSubview(self.resulttable!)
        
        print(self.view.bounds.width)
        /*let label = UILabel(frame: CGRect(x: self.view.bounds.width/2, y: self.view.bounds.height/2, width: 200, height: 200))
        label.text = "tongnima"
        label.font = UIFont(name: "Zapfino", size:20)
        label.tintColor = UIColor.red
        self.view.addSubview(label)*/
        
    }
    
    func numberOfSectionsInTableView(tableView:UITableView) -> Int {
        return 1
    }
    //table hangshu
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultarry.count
    }
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id: String = "resultcell"
        let cell = TableViewCell(style:UITableViewCellStyle.subtitle, reuseIdentifier: id)
        let secno = indexPath.row
        let data = resultarry[secno]
        cell.couponimg?.image = UIImage.image(fromURL: "", placeholder: UIImage(named:"test")!){_ in
        }
        cell.product?.text = data?["product"]
        cell.discount?.text = data?["discount"]
        cell.expiredtime?.text = data?["expiredtime"]
        cell.listprice?.text = data?["listprice"]
        return cell
    }
    
    func search( keyword: String){
        let url:NSURL = NSURL(string: URLString + "/post_searchForAndroid")!
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL)
        request.timeoutInterval = 5.0
        request.httpMethod = "POST"
        
        let param:NSString = NSString(format:"keyWord=%@", keyword)
        request.httpBody = param.data(using: String.Encoding.utf8.rawValue)
        
        let session = URLSession.shared
        let semaphore = DispatchSemaphore(value: 0)
        
        let dataTask = session.dataTask(with: request as URLRequest) {(data, reponse, error) -> Void in
            if error != nil {
                print("Error:\(error!)")
                let reminder = UILabel(frame: CGRect(x: self.view.bounds.width/10, y: self.view.bounds.height/2, width: self.view.bounds.width/5*4, height: self.view.bounds.height/18))
                reminder.text = "未搜索到任何符合条件的优惠券"
                reminder.tintColor = UIColor.gray
                reminder.font = UIFont(name: "Zapfino", size:15)
                reminder.textAlignment = .center
                self.view.addSubview(reminder)
            }else{
                //let str = NSString(data: data!,encoding:String.Encoding.utf8.rawValue)
                let jsons = JSON(data!)
                let jsoncount = jsons["coupon"].count
                if jsons["coupon"][0] == JSON.null{
                    let reminder = UILabel(frame: CGRect(x: self.view.bounds.width/10, y: self.view.bounds.height/2, width: self.view.bounds.width/5*4, height: self.view.bounds.height/18))
                    reminder.text = "未搜索到任何符合条件的优惠券"
                    reminder.tintColor = UIColor.gray
                    reminder.font = UIFont(name: "Zapfino", size:15)
                    reminder.textAlignment = .center
                    self.view.addSubview(reminder)
                }else {
                    
                    for i in 0 ..< jsoncount{
                        //self.presearchresult[i] = jsons["result"][i]["product"].string!
                        resultdic = Dictionary<String, String>()
                        for (key, subjson):(String, JSON) in jsons["coupon"][i]{
                            resultdic?[key] = subjson.string
                        }
                        self.resultarry.append(resultdic!)
                    }
                }
            }
            semaphore.signal()
        }as URLSessionTask
        
        dataTask.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
       

    }
    
    func key(controller: Search, keyword: String) {
        searchkey = keyword
    }
    
    func gotosearch(_ tap: UITapGestureRecognizer) ->Void{
        self.navigationController?.popViewController(animated: false)
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
