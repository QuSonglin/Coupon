//
//  messageStyle.swift
//  Coupon
//
//  Created by yaowenqing on 2017/7/31.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit

class messageStyle:UITableViewCell{
    
    var showImage : UIImageView?
    
    var content : UILabel?
    var messagecat :UILabel?
    var theTime:UILabel?
    var clickButton:UIButton?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style:UITableViewCellStyle,reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    func setUpUI(){
        
        clickButton=UIButton()
        clickButton?.frame=CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:95)
        clickButton?.backgroundColor=UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        self.addSubview(clickButton!)
        
        let view = UIView(frame: CGRect(x: 5,y: 18,width: 70,height: 70))
        view.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds=true
        view.layer.cornerRadius=view.frame.width/2
        self.addSubview(view)
        
        showImage=UIImageView(image:UIImage(named:"message"))
        showImage?.frame=CGRect(x:15,y:28,width:50,height:50)
        self.addSubview(showImage!)
       
        theTime=UILabel()
        theTime?.frame=CGRect(x:90,y:70,width:500,height:20)
        theTime?.font=UIFont.systemFont(ofSize: 15)
        theTime?.textColor=UIColor.lightGray
        self.addSubview(theTime!)
        
        messagecat=UILabel()
        messagecat?.frame=CGRect(x:90,y:(theTime?.frame)!.minY-22,width:500,height:20)
        messagecat?.font=UIFont.systemFont(ofSize:15)
        messagecat?.textColor=UIColor.lightGray
        self.addSubview(messagecat!)
        
        content=UILabel()
        content?.frame=CGRect(x:90,y:(messagecat?.frame)!.minY-28,width:500,height:30)
        content?.font=UIFont.systemFont(ofSize:25)
        content?.textColor=UIColor.black
        self.addSubview(content!)
        
    }
    func setValueForCell(dic:NSDictionary){
        content!.text="你好"
        messagecat!.text="我的私信"
        theTime!.text="2017-03-28"
        showImage!.image=UIImage(named:"envelope")
    }
    
    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    override func setSelected(_ selected:Bool,animated:Bool){
        super.setSelected(selected,animated:animated)
    }
    
    
}


