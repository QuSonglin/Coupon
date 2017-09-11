//
//  KindViewController.swift
//  hello
//
//  Created by niangniang on 2017/7/19.
//  Copyright © 2017年 niangniang. All rights reserved.
//

import UIKit

protocol kindparameter {
    func kindname(controller: KindViewController, kind:Int)
}

class KindViewController: UIViewController {

    var kinddelegate:kindparameter!
    
    //屏幕宽度
    let ScreenWidth = UIScreen.main.bounds.size.width
    var kind1: KindView?
    var kind2: KindView?
    var kind3: KindView?
    var kind4: KindView?
    var kind5: KindView?
    var kind6: KindView?
    var kind7: KindView?
    var kind8: KindView?
    override func viewDidLoad() {
        super.viewDidLoad()

        let left = ScreenWidth/10
        let gap = ScreenWidth/16
        let top = ScreenWidth/40
        let kindwidth = ScreenWidth/20*3
        let kindheight = ScreenWidth/40*9
        
        
        kind1?.tag = 0
        kind2?.tag = 1
        kind3?.tag = 2
        kind4?.tag = 3
        kind5?.tag = 4
        kind6?.tag = 5
        kind7?.tag = 6
        kind8?.tag = 7
        
        
        kind1 = KindView(frame: CGRect(x: left, y: top, width: kindwidth, height: kindheight))
        kind1?.img?.image = UIImage(named: "生活百货")
        kind1?.kindname?.text = "生活百货"
        
        kind2 = KindView(frame: CGRect(x: left + kindwidth + gap, y: top, width: kindwidth, height: kindheight))
        kind2?.img?.image = UIImage(named: "美妆妆饰")
        kind2?.kindname?.text = "美妆妆饰"
        
        kind3 = KindView(frame: CGRect(x: left + kindwidth*2 + gap*2, y: top, width: kindwidth, height: kindheight))
        kind3?.img?.image = UIImage(named: "文娱体育")
        kind3?.kindname?.text = "文娱体育"
        
        kind4 = KindView(frame: CGRect(x: left + kindwidth*3 + gap*3, y: top, width: kindwidth, height: kindheight))
        kind4?.img?.image = UIImage(named: "家居家具")
        kind4?.kindname?.text = "家居家具"
        
        kind5 = KindView(frame: CGRect(x: left, y: top + kindheight, width: kindwidth, height: kindheight))
        kind5?.img?.image = UIImage(named: "电子产品")
        kind5?.kindname?.text = "电子产品"
        
        kind6 = KindView(frame: CGRect(x: left + kindwidth + gap, y: top + kindheight, width: kindwidth, height: kindheight))
        kind6?.img?.image = UIImage(named: "服装装饰")
        kind6?.kindname?.text = "服装装饰"
        
        kind7 = KindView(frame: CGRect(x: left + kindwidth*2 + gap*2, y: top + kindheight, width: kindwidth, height: kindheight))
        kind7?.img?.image = UIImage(named: "旅行住宿")
        kind7?.kindname?.text = "旅行住宿"
        
        kind8 = KindView(frame: CGRect(x: left + kindwidth*3 + gap*3, y: top + kindheight, width: kindwidth, height: kindheight))
        kind8?.img?.image = UIImage(named: "饮食保健")
        kind8?.kindname?.text = "饮食保健"
       
        self.view.addSubview(kind1!)
        self.view.addSubview(kind2!)
        self.view.addSubview(kind3!)
        self.view.addSubview(kind4!)
        self.view.addSubview(kind5!)
        self.view.addSubview(kind6!)
        self.view.addSubview(kind7!)
        self.view.addSubview(kind8!)
        
        
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
