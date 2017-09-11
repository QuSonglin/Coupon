//
//  KindSelectView.swift
//  Coupon
//
//  Created by 屠明暄 on 2017/8/3.
//  Copyright © 2017年 iss. All rights reserved.
//

import UIKit

class KindSelectView: UIView {

    var icon: UIImageView?
    var kindname: UILabel?
    var border: UIView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        icon = UIImageView(frame: CGRect(x: self.frame.height/4, y: self.frame.height/4, width: self.frame.height/2, height: self.frame.height/2))
        kindname = UILabel(frame: CGRect(x: self.frame.height, y: 0, width: self.frame.width-self.frame.height, height: self.frame.height))
        border = UIView(frame: CGRect(x: 0, y: self.frame.height - 1 , width: self.frame.width, height: 1))
        border?.backgroundColor = UIColor.lightGray
        
        self.addSubview(icon!)
        self.addSubview(kindname!)
        self.addSubview(border!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
