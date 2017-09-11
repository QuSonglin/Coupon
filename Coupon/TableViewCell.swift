//
//  TableViewCell.swift
//  hello
//
//  Created by niangniang on 2017/7/24.
//  Copyright © 2017年 niangniang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    let screenWidth =  UIScreen.main.bounds.size.width
    
    var showImage   : UIImageView?
    var firstTitle  : UILabel?
    var subTitle    : UILabel?
    
    var historyicon : UIImageView?
    var historyitem : UILabel?
    var deleteicon  : UIImageView?
    
    var couponimg   : UIImageView?
    var product     : UILabel?
    var discount    : UILabel?
    var expiredtime : UILabel?
    var listprice   : UILabel?
    
    var border      : UIView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if reuseIdentifier == "presearchcell" {
            self.setUppresearch()
        }else if reuseIdentifier == "SwiftCell" {
            self.setUpUI()
        }else if reuseIdentifier == "resultcell" {
            self.serUpresult()
        } else if reuseIdentifier == "couponcell"{
            self.setUpCouponList()
        }else{
            self.setUpUI()
        }
        
    }
    func setUpCouponList() {
        let cellheight = UIScreen.main.bounds.height/6
        let cellwidth = screenWidth
        
        couponimg = UIImageView.init(frame: CGRect(x: cellheight/8, y: cellheight/8, width: cellwidth/4, height:cellheight/4*3))
        self.addSubview(couponimg!)
        
        product = UILabel.init(frame: CGRect(x: cellheight/4 + cellwidth/4, y: cellheight/8, width: cellwidth/2, height: cellheight/4))
        product?.font = UIFont.systemFont(ofSize: 26)
        product?.textAlignment = NSTextAlignment.left
        product?.textColor = UIColor.black
        self.addSubview(product!)
        
        discount = UILabel.init(frame: CGRect(x: cellheight/4 + cellwidth/4, y: cellheight/8*3 + cellheight/16, width: cellwidth/2, height: cellheight/8))
        discount?.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(discount!)
        
        expiredtime = UILabel.init(frame: CGRect(x: cellheight/4 + cellwidth/4, y: cellheight/8*4 + cellheight/8, width: cellwidth/2, height: cellheight/8))
        expiredtime?.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(expiredtime!)
        
        listprice = UILabel.init(frame: CGRect(x: cellheight/4 + cellwidth/4, y: cellheight/8*5 + cellheight/16 * 3, width: cellwidth/4*3 - cellheight/8*3, height: cellheight/16*3))
        listprice?.font = UIFont(name: "Bobz Type", size: 21)
        listprice?.textAlignment = .right
        listprice?.textColor = UIColor.orange
        self.addSubview(listprice!)
        
        border = UIView(frame: CGRect(x: 0, y: cellheight-1, width: screenWidth, height: 1))
        self.addSubview(border!)
    }
    
    func setUpUI() {
        let cellheight = screenWidth/10*3
        
        couponimg = UIImageView.init(frame: CGRect(x: screenWidth/32, y: cellheight/8, width: screenWidth/32*10, height: cellheight/8*6))
        //showImage!.layer.masksToBounds = true //shezhi yuanjiao
        self.addSubview(couponimg!)
        
        product = UILabel.init(frame: CGRect(x: screenWidth/32*15, y: cellheight/16*3, width: screenWidth/32*17, height: cellheight/9*2))
        product?.font = UIFont.systemFont(ofSize: 20)
        product?.textAlignment = NSTextAlignment.left
        product?.textColor = UIColor.black
        self.addSubview(product!)
        
        discount = UILabel.init(frame: CGRect(x: screenWidth/32*15, y: cellheight/18*8, width: screenWidth/32*17, height:cellheight/9*2))
        discount?.font = UIFont.systemFont(ofSize: 15)
        discount?.textAlignment = NSTextAlignment.left
        discount?.textColor = UIColor.black
        self.addSubview(discount!)
        
        listprice = UILabel.init(frame: CGRect(x: screenWidth/20*16, y: cellheight/12*9, width: screenWidth/20*4, height: cellheight/6))
        listprice?.font = UIFont(name: "Bobz Type", size: 15)
        listprice?.textColor = UIColor.orange
        self.addSubview(listprice!)
        
        border = UIView(frame: CGRect(x: 0, y: cellheight-1, width: screenWidth, height: 1))
        self.addSubview(border!)
        
    }
    
    func setUppresearch() {
        historyicon = UIImageView.init(frame: CGRect(x: self.bounds.width/15, y: self.bounds.height/4, width: self.bounds.width/15, height: self.bounds.height/2))
        self.addSubview( historyicon!)
        
        historyitem = UILabel.init(frame: CGRect(x: self.bounds.width/15*3, y: self.bounds.height/4, width: self.bounds.width/15*11, height: self.bounds.height/2))
        self.addSubview( historyitem!)
        
        deleteicon = UIImageView.init(frame: CGRect(x: self.bounds.width/15*13, y: self.bounds.height/4, width: self.bounds.width/15, height: self.bounds.height/2))
        self.addSubview( deleteicon!)
    }
    
    func serUpresult() {
        couponimg = UIImageView.init(frame: CGRect(x: self.bounds.width/20, y: self.bounds.height/6, width: self.bounds.width/20*6, height: self.bounds.height/3*2))
        self.addSubview(couponimg!)
        product = UILabel.init(frame: CGRect(x: self.bounds.width/20*8, y: self.bounds.height/12*3, width: self.bounds.width/20*12, height: self.bounds.height/6))
        product?.font = UIFont(name: "Zapfino", size: 13)
        self.addSubview(product!)
        discount = UILabel.init(frame: CGRect(x: self.bounds.width/20*8, y: self.bounds.height/12*4, width: self.bounds.width/20*12, height: self.bounds.height/12))
        discount?.font = UIFont(name: "Zapfino", size: 10)
        self.addSubview(discount!)
        expiredtime = UILabel.init(frame: CGRect(x: self.bounds.width/20*8, y: self.bounds.height/12*5, width: self.bounds.width/20*12, height: self.bounds.height/12))
        expiredtime?.font = UIFont(name: "Zapfino", size: 10)
        self.addSubview(expiredtime!)
        listprice = UILabel.init(frame: CGRect(x: self.bounds.width/20*17, y: self.bounds.height/12*9, width: self.bounds.width/20*3, height: self.bounds.height/6))
        listprice?.font = UIFont(name: "Zapfino", size: 14)
        listprice?.tintColor = UIColor.orange
        self.addSubview(listprice!)
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
