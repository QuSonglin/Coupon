//
//  BuyViewController.swift
//  hello
//
//  Created by niangniang on 2017/7/16.
//  Copyright © 2017年 niangniang. All rights reserved.
//

import Foundation
import UIKit

protocol Couponid {
    func couponid( id: String)
}

var coupondic: Dictionary< String, String>?
class BuyViewController: UIViewController, SliderGalleryControllerDelegate, UITableViewDelegate, UITableViewDataSource{
    
    //delegate
    var gotodetail: Couponid?
    
    var user_id: String?
    //获取屏幕宽度
    let screenWidth =  UIScreen.main.bounds.size.width
    //图片轮播组件
    var sliderGallery : SliderGalleryController!
    var kindView = KindViewController()
    //
    var tableView:UITableView?
    var couponarry = [coupondic]
    //string couponid,pic,product,discount,expiredtime,value
    
    var adHeaders:[String]?
    
    override func loadView(){
        super.loadView()
    }
    var img = UIImage(named: "img/bg0.png")
    
    //search
    
    var searchtable:UITableView?
    var searchresult:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let view = UIImageView(frame: CGRect(x:0, y:0, width: self.view.bounds.width - 40, height: (self.navigationController?.navigationBar.bounds.height)!/3*2))
        //view.tintColor = UIColor.white
        view.image = UIImage(named: "搜索栏")
        //let rightNavBarButton = UIBarButtonItem(customView:view)
        self.navigationItem.titleView = view
        self.navigationItem.titleView?.isUserInteractionEnabled = true
        let searchtap = UITapGestureRecognizer(target: self, action: #selector( gotosearch(_:)))
        self.navigationItem.titleView?.addGestureRecognizer( searchtap)
        
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1)
        
        
        
        //初始化图片轮播组件
        sliderGallery = SliderGalleryController()
        sliderGallery.delegate = self
        sliderGallery.view.frame = CGRect(x: 0, y: 0, width: screenWidth,height: screenWidth/2)
        //将图片轮播组件添加到当前视图
        self.addChildViewController(sliderGallery)
        //self.view.addSubview(sliderGallery.view)
        //添加组件的点击事件
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(BuyViewController.handleTapAction(_:)))
        sliderGallery.view.addGestureRecognizer(tap)
        
        
        kindView.view.frame = CGRect(x: 0, y: screenWidth/2, width: screenWidth, height: screenWidth/40*19)
        self.addkindtap(kind: kindView.kind1!)
        self.addkindtap(kind: kindView.kind2!)
        self.addkindtap(kind: kindView.kind3!)
        self.addkindtap(kind: kindView.kind4!)
        self.addkindtap(kind: kindView.kind5!)
        self.addkindtap(kind: kindView.kind6!)
        self.addkindtap(kind: kindView.kind7!)
        self.addkindtap(kind: kindView.kind8!)
        
        let divider = UIView(frame: CGRect(x: 0, y: screenWidth/40*39, width: screenWidth, height: screenWidth/40))
        divider.tintColor = UIColor.gray
        
        self.settableinfo()
        self.setUpTable()
        
        let tablecount = CGFloat(couponarry.count)//tableinfo?.count
        let tableheight: CGFloat = screenWidth/4*tablecount
        
        
        //scrollView
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        let scrollViewWidth = scrollView.bounds.width
        let scrollViewHeight = scrollView.bounds.height + kindView.view.bounds.height + tableheight
        scrollView.contentSize = CGSize(width:scrollViewWidth,height:scrollViewHeight)
        scrollView.addSubview(sliderGallery.view)
        scrollView.addSubview(kindView.view)
        scrollView.addSubview(divider)
        scrollView.addSubview(self.tableView!)
        
        self.view.addSubview(scrollView)
        
        
        // Do any additional setup after loading the view.
    }

    func gotosearch(_ tap: UITapGestureRecognizer) ->Void{
        let nextvc = Search()
        //print(user_id!)
        self.navigationController?.pushViewController(nextvc, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //点击事件响应
    func handleTapAction(_ tap:UITapGestureRecognizer)->Void{
        //获取图片索引值
        /*let index = sliderGallery.currentIndex
        //弹出索引信息
        let alertController = UIAlertController(title: "您点击的图片索引是：",
                                                message: "\(index)", preferredStyle: .alert)
        print()
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)*/
    }

    //图片轮播组件协议方法：获取数据集合
    func galleryDateSource() -> [String] {
        var picarry = [String]()
        var picture: String?
        let url:NSURL = NSURL(string: URLString + "/post_getBanner")!
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL)
        request.timeoutInterval = 5.0
        request.httpMethod = "POST"
        
        let session = URLSession.shared
        let semaphore = DispatchSemaphore(value: 0)
        
        let dataTask = session.dataTask(with: request as URLRequest) {(data, reponse, error) -> Void in
            if error != nil {
                print("Error:\(error!)")
            }else{
                //let str = NSString(data: data!,encoding:String.Encoding.utf8.rawValue)
                let jsons = JSON(data!)
                let jsonscount = jsons["result"].count
                for i in 0 ..< jsonscount{
                    picture = URLString + "/static/" + (jsons["result"][i].string?.replacingOccurrences(of: "\\\\", with: ""))!
                    picarry.append( picture!)
                }
                print(jsons)
            }
            semaphore.signal()
        }as URLSessionTask
        dataTask.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        print(picarry)
        return picarry
    }
    
    
    
    //图片轮播组件协议方法：获取内部scrollView尺寸
    func galleryScrollerViewSize() -> CGSize {
        return CGSize(width: screenWidth, height: screenWidth/2)
    }
    
    //kind tapaction
    func kindtapAction(tap:UITapGestureRecognizer){
        let vc = KindSingleViewController()
        kindView.kinddelegate = vc
        kindView.kinddelegate?.kindname(controller: kindView, kind: (tap.view?.tag)!)
        self.navigationController?.pushViewController(vc, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        //self.present(vc, animated: true, completion: nil)
    }
    var i = 0
    func addkindtap(kind: KindView){
        kind.isUserInteractionEnabled = true
        kind.tag = i
        let kindtap = UITapGestureRecognizer(target:self, action:#selector(BuyViewController.kindtapAction(tap:)))
        kind.addGestureRecognizer(kindtap)
        i = i + 1
    }

    
    
    //tableview
    //优惠券列表 获取数据 delegate
    func settableinfo() {
        
        let url:NSURL = NSURL(string: URLString + "/post_homepageCoupon")!
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL)
        request.timeoutInterval = 5.0
        request.httpMethod = "POST"
        
        let session = URLSession.shared
        let semaphore = DispatchSemaphore(value: 0)
        
        let dataTask = session.dataTask(with: request as URLRequest) {(data, reponse, error) -> Void in
            if error != nil {
                print("Error:\(error!)")
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
                //print(jsons)
            }
            semaphore.signal()
            }as URLSessionTask
        dataTask.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
    }
    
    func setUpTable(){
        let tablecount = CGFloat(couponarry.count)//tableinfo?.count
        let tableheight: CGFloat = screenWidth/10*3 * tablecount
        tableView = UITableView.init( frame: CGRect(x:0, y: screenWidth, width: screenWidth , height: tableheight))
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        
        //self.tableView?.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        
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
        return screenWidth/10*3
    }
    //UITableViewDataSource协议方法 返回值决定分区头部
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let headers = ""
        return headers
    }
    //UITableViewDataSource协议方法 返回值决定分区wei部
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let rooters = ""
        return rooters
    }
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identify:String = "SwiftCell"
        let cell = TableViewCell(style:UITableViewCellStyle.subtitle, reuseIdentifier: identify)
        let secno = indexPath.row
        let data = self.couponarry[secno]
        
        if data == nil {
            promptWindow(ms: "未连接到服务器")
        }else{
        
            cell.product?.text = data?["product"]
            cell.discount?.text = data?["discount"]
            cell.listprice?.text = "$" + (data?["listprice"])!
            let picture = data?["pic"]?.replacingOccurrences(of: "\\\\", with: "")
            print( URLString + "/static/" + picture!)
            cell.couponimg?.image = UIImage.image(fromURL: URLString + "/static/" + picture!, placeholder: UIImage()){_ in
            }
            cell.border?.backgroundColor = UIColor.lightGray
            cell.selectionStyle = UITableViewCellSelectionStyle.none
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
