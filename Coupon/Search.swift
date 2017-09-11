//
//  Search.swift
//  hello
//
//  Created by niangniang on 2017/7/27.
//  Copyright © 2017年 niangniang. All rights reserved.
//
import UIKit

var historytable: UITableView?
var historydata = ["我觉得可以", "666", "梦", "稀有", "炉石传说真尼玛好玩"]


var presearchdata = [String]()

protocol keyword{
    func key(controller: Search, keyword:String)
}

class Search: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{

    var keyworddelegate: keyword!
    var presearchtable: UITableView?
    var searchBar: UISearchBar = UISearchBar(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.size.width/20*19,height:20))
    var searchtable:UITableView?
    var presearchresult:[String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //let searchBar: UISearchBar = UISearchBar(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.size.width,height:20))
        
        searchBar.placeholder = "搜索"
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        
        let cancelbutton = searchBar.value(forKey: "cancelButton")as! UIButton
        cancelbutton.tintColor = UIColor.white
        cancelbutton.setTitle("取消", for: UIControlState.normal)
        //初始进入编辑状态
        searchBar.becomeFirstResponder()
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        
        

        
        
        presearchresult = historydata
        presearchtable = UITableView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        presearchtable?.delegate = self
        presearchtable?.dataSource = self
        presearchtable?.separatorStyle = UITableViewCellSeparatorStyle.none
        presearchtable?.rowHeight = self.view.bounds.height/18
        //presearchtable?.register(UITableViewCell.self, forCellReuseIdentifier: "presearchcell")
        self.view.addSubview( presearchtable!)
        /*
        searchtable = UITableView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        searchtable?.delegate = self
        searchtable?.dataSource = self
        searchtable?.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        searchtable?.rowHeight = self.view.bounds.height/6
        searchtable?.register(UITableViewCell.self, forCellReuseIdentifier: "resultcell")
        self.view.addSubview(searchtable!)
        */
        
        
        
        
        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView:UITableView) -> Int {
        return 1
    }
    //table hangshu
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presearchresult.count
        
    }

    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id: String = "presearchcell"
        let cell = TableViewCell(style:UITableViewCellStyle.subtitle, reuseIdentifier: id)
        let secno = indexPath.row
        let data = presearchresult[secno]
        cell.historyicon?.image = UIImage(named: "img/a.png")
        cell.historyitem?.text = data
        let deleicon = UIImage(named: "x")?.resize(toSize: CGSize(width: cell.bounds.width/18, height: cell.bounds.width/18))
        cell.deleteicon?.image = deleicon
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchBar.text = presearchresult[indexPath.row]
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let url:NSURL = NSURL(string: URLString + "/post_preSearch")!
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL)
        request.timeoutInterval = 5.0
        request.httpMethod = "POST"
        
        if searchText == "" {
            presearchresult = historydata
        }else {
            let param:NSString = NSString(format:"keyword=%@", searchText)
            request.httpBody = param.data(using: String.Encoding.utf8.rawValue)
            
            let session = URLSession.shared
            let semaphore = DispatchSemaphore(value: 0)
            
            let dataTask = session.dataTask(with: request as URLRequest) {(data, reponse, error) -> Void in
                if error != nil {
                    print("Error:\(error!)")
                }else{
                    //let str = NSString(data: data!,encoding:String.Encoding.utf8.rawValue)
                    self.presearchresult = []
                    let jsons = JSON(data!)
                    let jsoncount = jsons["result"].count
                    if jsons["result"][0] == JSON.null{
                        
                    }else {
                        for i in 0 ..< jsoncount{
                            //self.presearchresult[i] = jsons["result"][i]["product"].string!
                            self.presearchresult.append(jsons["result"][i]["product"].string!)
                        }
                        self.presearchtable?.reloadData()
                        print(jsons)
                    }
                    //print(jsons)
                }
                semaphore.signal()
                }as URLSessionTask
            dataTask.resume()
            _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchresultview = SearchResult()
        searchresultview.key(controller: self, keyword: searchBar.text!)
        self.navigationController?.pushViewController(searchresultview , animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
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
