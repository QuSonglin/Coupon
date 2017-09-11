//
//  KindView.swift
//  Coupon
//
//  Created by 屠明暄 on 2017/8/2.
//  Copyright © 2017年 iss. All rights reserved.
//

import UIKit

class KindView: UIView {

    var background: UIView?
    var img: UIImageView?
    var kindname: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        background = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.width))
        background?.layer.cornerRadius = self.bounds.width/2
        background?.backgroundColor = UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1)
        
        img = UIImageView(frame: CGRect(x: self.bounds.width/4, y: self.bounds.width/4, width: self.bounds.width/2, height: self.bounds.width/2))
        
        kindname = UILabel(frame: CGRect(x: 0, y: self.bounds.width, width: self.bounds.width, height: self.bounds.width/2))
        kindname?.font = UIFont(name: "Zapfino", size: 12)
        kindname?.tintColor = UIColor.black
        kindname?.textAlignment = .center
        
        self.addSubview(background!)
        self.addSubview(img!)
        self.addSubview(kindname!)
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
