//
//  TabBarViewController.swift
//  hello
//
//  Created by niangniang on 2017/7/15.
//  Copyright © 2017年 niangniang. All rights reserved.
//

import UIKit
var UID: String?
class TabBarViewController: UITabBarController ,pass_parameter{

    func parameter(controller: Login, u_id: String) {
        User_Id = u_id
    }
    
    
    
    var User_Id: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let viewbuy = BuyViewController()
        
        let viewmine = Mine()
        
        self.tabBar.isTranslucent = false  //避免受默认的半透明色影响，关闭
        self.tabBar.tintColor = UIColor.white //设置选中颜色
        self.tabBar.backgroundColor = UIColor.lightGray
        
        
        //buy
        let buy = UINavigationController(rootViewController: viewbuy)
        let buyimg = UIImage(named:"homepage")
        let buyselectedimg = UIImage(named:"home_selected")
        buy.tabBarItem = UITabBarItem(title:"买", image: buyimg, selectedImage: buyselectedimg)
        //buy.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: -self.view.bounds.width/6, bottom: 0, right: self.view.bounds.width/6)
        buy.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: -self.view.bounds.width/12, vertical: 0)
        
        
        let mine = UINavigationController(rootViewController:viewmine)
        let mineimg = UIImage(named:"mine")
        let mineselectedimg = UIImage(named:"mine_selected")
        mine.tabBarItem = UITabBarItem( title:"我的", image: mineimg, selectedImage: mineselectedimg)
        //mine.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: self.view.bounds.width/6, bottom: 0, right: -self.view.bounds.width/6)
        mine.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: self.view.bounds.width/12, vertical: 0)
        
        
        let testview = UIImageView(frame: CGRect(x: self.view.bounds.width/12*5, y: -self.tabBar.bounds.height/4, width: self.view.bounds.width/6, height: self.tabBar.bounds.height/4*5))
        testview.image = UIImage(named: "sell")
        testview.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(gotosell(_:)))
        testview.addGestureRecognizer(tap)
        
        //self.tabBar.barTintColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        self.tabBar.barTintColor = UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1)
        
        self.viewControllers = [buy, mine]
        self.tabBar.addSubview(testview)
        self.selectedIndex = 0
        
        // Do any additional setup after loading the view.
    }

    func gotosell (_ tap: UITapGestureRecognizer) -> Void{
        let nextview = SellNavgationController()
        nextview.navigationBar.isHidden = true
        self.present(nextview, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
