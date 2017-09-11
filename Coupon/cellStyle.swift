//
//  focusCell.swift
//  Coupon
//
//  Created by yaowenqing on 2017/7/25.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit

class cellStyle:UITableViewCell{
    
    var yhqbg : UIImageView?
    var productName_label : UILabel?
    var price_label :UILabel?
    var pvalue_label :UILabel?
    var pdiscount_label:UILabel?
    var extiredtime_label:UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style:UITableViewCellStyle,reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    func setUpUI(){
        yhqbg = UIImageView(image: UIImage(named: "yhq.png"))
        yhqbg?.frame=CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:140)
        //yhqbg?.frame.size = CGSize(width: self.bounds.width, height: 140)
        //yhqbg?.center = CGPoint(x: self.bounds.width / 2, y: 100)
        self.addSubview(yhqbg!)
        
        
        price_label = UILabel()
        price_label?.frame.size = CGSize(width: (self.bounds.width / 2), height: 40 )
        price_label?.center = CGPoint(x: (self.bounds.width)*3 / 16, y: 60)
        price_label?.font = UIFont.systemFont(ofSize: 36)
        price_label?.textAlignment = NSTextAlignment.center
        price_label?.textColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        self.addSubview(price_label!)
        
        pvalue_label = UILabel()
        pvalue_label?.frame.size = CGSize(width: (self.bounds.width / 4), height: 30 )
        pvalue_label?.center = CGPoint(x: (self.bounds.width)*3 / 16, y: 85)
        pvalue_label?.font = UIFont.systemFont(ofSize: 14)
        pvalue_label?.textAlignment = NSTextAlignment.center
        pvalue_label?.textColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        self.addSubview(pvalue_label!)
        
        extiredtime_label = UILabel()
        extiredtime_label?.frame = CGRect(x: 15, y: 137, width: 240, height: 30)
        extiredtime_label?.font = UIFont.systemFont(ofSize: 18)
        extiredtime_label?.textColor = UIColor.lightGray
        self.addSubview(extiredtime_label!)
        
        productName_label = UILabel()
        productName_label?.frame = CGRect(x: self.bounds.width / 2, y: 40, width: 240, height: 30)
        productName_label?.font = UIFont.systemFont(ofSize: 26)
        productName_label?.textColor = UIColor.darkGray
        self.addSubview(productName_label!)
        
        pdiscount_label = UILabel()
        pdiscount_label?.frame = CGRect(x: self.bounds.width / 2, y: 70, width: 240, height: 30)
        pdiscount_label?.font = UIFont.systemFont(ofSize: 18)
        pdiscount_label?.textColor = UIColor.lightGray
        self.addSubview(pdiscount_label!)
        
    }
    func setValueForCell(dic:NSDictionary){
        pvalue_label!.text="估值：$2"
        productName_label!.text="吮指原味鸡"
        price_label!.text="$"+"20"
        pdiscount_label!.text="消费满100元立减40元"
        extiredtime_label!.text="有效期至："+"2017-09-09"
        yhqbg!.image=UIImage(named:"yhq.png")
    }
    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    override func setSelected(_ selected:Bool,animated:Bool){
        super.setSelected(selected,animated:animated)
    }
    
    
}





































