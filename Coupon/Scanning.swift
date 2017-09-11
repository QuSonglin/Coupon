//
//  Scanning.swift
//  hello
//
//  Created by niangniang on 2017/7/14.
//  Copyright © 2017年 niangniang. All rights reserved.
//

import UIKit

class Scanning: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button:UIButton = UIButton(type:.contactAdd)
        button.frame = CGRect(x:30,y:30,width:50,height:50)
        button.setTitle("求你了", for: .normal)
        self.view.addSubview(button)
        // Do any additional setup after loading the view.
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
