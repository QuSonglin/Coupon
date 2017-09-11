//
//  CouponLimitCell.swift
//  Coupon
//
//  Created by 屠明暄 on 2017/8/4.
//  Copyright © 2017年 iss. All rights reserved.
//

import UIKit

//表格数据实体类
class ListItem: NSObject {
    var text: String
    init(text: String) {
        self.text = text
    }
}
class CouponLimitCell: UITableViewCell, UITextFieldDelegate {

    var label: UITextField
    var leftmargin: CGFloat = 15
    
    //单元格数据
    var listItem:ListItem? {
        didSet {
            label.text = listItem!.text
        }
    }
    //初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        //初始化文本标签
        label = UITextField(frame: CGRect.null)
        label.placeholder = "请输入"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.isUserInteractionEnabled = true
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //设置文本标签代理
        label.delegate = self
        label.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        //添加文本标签
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //布局
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 50, y: 0,
                             width: bounds.size.width - leftmargin,
                             height: bounds.size.height)
    }
    
    //键盘回车
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        textField.isUserInteractionEnabled = false
        return false
    }
  
    //结束编辑
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if listItem != nil {
            listItem?.text = textField.text!
        }
        return true
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
