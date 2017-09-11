//
//  FillCouponInfo.swift
//  hello
//
//  Created by niangniang on 2017/7/27.
//  Copyright © 2017年 niangniang. All rights reserved.
//

import UIKit


var category: KindInfoItem?

protocol CouponInfo {
    func couponinfo(product: String, brand: String, discount: String, category: String, expiredtime: String, limit: [String] )
}

class FillCouponInfo: UIViewController , UITableViewDelegate, UITableViewDataSource{
    var product: KindInfoItem?
    var brand: KindInfoItem?
    var discount: KindInfoItem?
    
    var expiredtime: KindInfoItem?
    
    
    var limitarry: [ListItem]?
    var limittable: UITableView?
    
    var delegate: CouponInfo?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "填写信息"
        self.view.backgroundColor = UIColor.white
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(backtoPrevious))
        leftBarBtn.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = leftBarBtn
        
        let prey = (self.navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height
        
        let itemheight = self.view.bounds.height/1950*119
        //trade
        product = KindInfoItem(frame: CGRect(x: 0, y: prey, width: self.view.bounds.width, height: itemheight))
        product?.item?.text = "商品名"
       
        //business
        brand = KindInfoItem(frame: CGRect(x: 0, y: prey + itemheight, width: self.view.bounds.width, height: itemheight))
        brand?.item?.text = "商家名"
        //discount
        discount = KindInfoItem(frame: CGRect(x: 0, y: prey + itemheight*2, width: self.view.bounds.width, height: itemheight))
        discount?.item?.text = "优惠额度"
        
        //category
        category = KindInfoItem(frame: CGRect(x: 0, y: prey + itemheight*3, width: self.view.bounds.width, height: itemheight))
        category?.item?.text = "种类"
        //category的click
        let clickview = UIView()
        clickview.frame = (category?.frame)!
        clickview.tintColor = self.view.backgroundColor
    
        let click = UITapGestureRecognizer(target: self, action:#selector(gotocategory(_:)))
        clickview.isUserInteractionEnabled = true
        clickview.addGestureRecognizer(click)
        
        //expiredtime
        expiredtime = KindInfoItem(frame: CGRect(x: 0, y: prey + itemheight*4, width: self.view.bounds.width, height: itemheight))
        expiredtime?.item?.text = "过期时间"
        //category的click
        let clickexpiredview = UIView()
        clickexpiredview.frame = (expiredtime!.frame)
        clickexpiredview.tintColor = self.view.backgroundColor
        
        let clickexpired = UITapGestureRecognizer(target: self, action:#selector( selectdate(_:)))
        clickexpiredview.isUserInteractionEnabled = true
        clickexpiredview.addGestureRecognizer(clickexpired)
        
        
        
        //limittable
        limitarry = []
        // 创建表格
        limittable = UITableView.init(frame: CGRect(x: self.view.frame.width/13, y:  prey + itemheight*5, width: self.view.bounds.width/20*17, height: self.view.bounds.height/3), style: UITableViewStyle.plain)
        limittable?.delegate = self
        limittable?.dataSource = self
        limittable?.isEditing = true
        limittable?.register( CouponLimitCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(limittable!)
        
        let limitlabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 30))
        limitlabel.text = "使用门槛"
        limitlabel.backgroundColor = UIColor.lightGray
        limitlabel.textColor = UIColor.white
        limittable?.tableHeaderView = limitlabel
        
        let editbutton = UIButton( frame: CGRect( x: self.view.bounds.width/3, y: self.view.bounds.height/2 - 30, width: self.view.bounds.width/3, height: 30))
        editbutton.backgroundColor = UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1)
        editbutton.setTitle( "保存", for: UIControlState())
        editbutton.addTarget(self, action: #selector(editBarBtnClick(_:)), for: .touchUpInside)
        //self.view.addSubview(editbutton)
        
        //确认提交
        let conformBtn = UIButton(type: .system)
        conformBtn.addTarget(self, action: #selector(conform), for: .touchUpInside)
        conformBtn.frame = CGRect(x:0, y: self.view.bounds.height - (self.navigationController?.navigationBar.bounds.height)! , width: self.view.bounds.width, height: (self.navigationController?.navigationBar.bounds.height)!)
        conformBtn.setTitle("确认", for: UIControlState())
        conformBtn.backgroundColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        conformBtn.setTitleColor(UIColor.white,for: UIControlState()) //普通状态下文字的颜色
        conformBtn.setTitleColor(UIColor.gray,for: .highlighted) //触摸状态下文字的颜色
        self.view.addSubview(conformBtn)
        
        // Do any additional setup after loading the view.
        self.view.addSubview(product!)
        self.view.addSubview(brand!)
        self.view.addSubview(discount!)
        self.view.addSubview(category!)
        self.view.addSubview(clickview)
        self.view.addSubview(expiredtime!)
        self.view.addSubview(clickexpiredview)
        
    }

    func numberOfSectionsInTableView(tableView:UITableView) -> Int {
        return 1
    }
    //table hangshu
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = limitarry?.count
        if tableView.isEditing {
            count = count! + 1
        }
        return count!
    }
    
    var cellcount = 0
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identify = "SwiftCell"
        
        var cell = CouponLimitCell()
        cell = CouponLimitCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: identify)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        if tableView.isEditing && indexPath.row == limitarry?.count {
            let item = ListItem(text: "请添加")
            cell.label.isUserInteractionEnabled = false
            cell.listItem = item
        }else{
            let item = limitarry?[indexPath.row]
            cell.listItem = item
            cell.accessoryType = .disclosureIndicator
        }
        cellcount = cellcount + 1
        return cell
    }
    // 设置单元格的编辑的样式
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if tableView.isEditing == false {
            return UITableViewCellEditingStyle.none
        }else if indexPath.row == limitarry?.count {
            return UITableViewCellEditingStyle.insert
        }else {
            return UITableViewCellEditingStyle.delete
        }
    }
    // 设置确认删除按钮的文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "确认删除"
    }
    // 单元格编辑后的响应方法
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.limitarry?.remove(at: indexPath.row)
            //            tableView.setEditing(false, animated: true)
        }else if editingStyle == UITableViewCellEditingStyle.insert{
            let limit = ListItem(text: "")
            self.limitarry?.insert( limit, at: indexPath.row)
            //            tableView.setEditing(false, animated: true)
        }
        
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //limittable[indexPath.row]
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            limitarry!.remove(at: indexPath.row)
            limittable?.reloadData()
        }
        
    }
    @IBAction func editBarBtnClick(_ sender: UIBarButtonItem) {
        //在正常状态和编辑状态之间切换
        if( limittable?.isEditing == false){
            limittable?.setEditing(true, animated:true)
            sender.title = "保存"
        }
        else{
            limittable?.setEditing(false, animated:true)
            sender.title = "编辑"
        }
        //重新加载表数据（改变单元格输入框编辑/只读状态）
        limittable?.reloadData()
    }
    func backtoPrevious(){
        self.navigationController!.popViewController(animated: true)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    func gotocategory(_ tap:UITapGestureRecognizer)  -> Void{
        let nextvc = SelectCategory()
        self.navigationController?.pushViewController(nextvc, animated: true)
    }
    func selectdate(_ tap: UITapGestureRecognizer) -> Void{
        let alertController: UIAlertController = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n",
                                                                   message: nil,
                                                                   preferredStyle: .actionSheet)
        let datePicker = UIDatePicker()
        datePicker.frame = CGRect(x: 0, y: 0, width:alertController.view.bounds.width, height:datePicker.bounds.height)
        datePicker.locale = Locale(identifier: "zh_CN")
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.date = NSDate() as Date
        
        let okaction = UIAlertAction( title: "确定", style: .default, handler: {
            action in
            print("date: \(datePicker.date)")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let stringdate = dateFormatter.string(from: datePicker.date)
            self.expiredtime?.textfield?.text = stringdate
        })
        alertController.view.addSubview(datePicker)
        alertController.addAction( okaction)
        alertController.addAction( UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present( alertController, animated: true, completion:  nil)
    }
    func conform(){
        if brand?.textfield?.text != "" && discount?.textfield?.text != "" && product?.textfield?.text != "" && category?.textfield?.text != "" && expiredtime?.textfield?.text != ""{
            var alllimit =  [String]()
            for limit in limitarry!{
                alllimit.append(limit.text)
            }
            let nextvc = ValuationViewView()
            delegate = nextvc
            delegate?.couponinfo(product: (product?.textfield?.text)!, brand: (brand?.textfield?.text)!, discount: (discount?.textfield?.text)!, category: (category?.textfield?.text)!, expiredtime: (expiredtime?.textfield?.text)!, limit: alllimit)
            self.navigationController?.pushViewController(nextvc, animated: true)
        }else{
            let alertController = UIAlertController(title: "请完整填写优惠券信息", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "好的", style: .destructive, handler: nil)
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
            
        
        
        
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
