//
//  ViewController.swift
//  Coupon
//
//  Created by macbook on 17/7/11.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let message = "coolketang.com"
        print("Result:"+message.MD5())
        print("Length:\(message.MD5().lengthOfBytes(using: String.Encoding.utf8))")
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

