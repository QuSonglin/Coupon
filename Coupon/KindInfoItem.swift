//
//  KindInfoItem.swift
//  Coupon
//
//  Created by 屠明暄 on 2017/8/4.
//  Copyright © 2017年 iss. All rights reserved.
//

import UIKit

class KindInfoItem: UIView ,UITextFieldDelegate{

    var item: UILabel?
    var textfield: UITextField?
    var border: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        item = UILabel(frame: CGRect(x: self.frame.width/13, y: self.frame.height/5*2, width: self.frame.width/5, height: self.frame.height/5*3))
        textfield = UITextField( frame: CGRect(x: self.frame.width/65*18, y: self.frame.height/5*2, width: self.frame.width/20*13, height: self.frame.height/5*3))
        textfield?.adjustsFontSizeToFitWidth = true
        textfield?.minimumFontSize = 15
        textfield?.textAlignment = .left
        textfield?.clearButtonMode = .whileEditing
        textfield?.keyboardType = UIKeyboardType.default
        border = UIView(frame: CGRect(x: self.frame.width/65*18, y: self.frame.height-1, width: self.frame.width/20*13, height: 1))
        border?.backgroundColor = UIColor.lightGray
        
        self.addSubview(item!)
        self.addSubview(textfield!)
        self.addSubview(border!)
    }
    //键盘回车
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
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
