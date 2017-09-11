//
//  SelectCategory.swift
//  hello
//
//  Created by 张 on 2017/7/29.
//  Copyright © 2017年 niangniang. All rights reserved.
//

import UIKit

class SelectCategory: UIViewController {

    var kind1: KindSelectView?
    var kind2: KindSelectView?
    var kind3: KindSelectView?
    var kind4: KindSelectView?
    var kind5: KindSelectView?
    var kind6: KindSelectView?
    var kind7: KindSelectView?
    var kind8: KindSelectView?
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(backtoPrevious))
        leftBarBtn.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = leftBarBtn
        self.title = "品种"
        self.view.backgroundColor = UIColor.white
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        // Do any additional setup after loading the view.
        
        let kindheight = self.view.frame.height/40 * 3
        let navheight = (self.navigationController?.navigationBar.bounds.height)! + UIApplication.shared.statusBarFrame.height
        kind1 = KindSelectView(frame: CGRect(x: 0, y: navheight, width: self.view.frame.width, height: kindheight))
        kind1?.icon?.image = UIImage(named: "生活百货")?.changeColor(color: UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1))
        kind1?.kindname?.text = "生活百货"
        
        kind2 = KindSelectView(frame: CGRect(x: 0, y: navheight + kindheight, width: self.view.frame.width, height: kindheight))
        kind2?.icon?.image = UIImage(named: "美妆妆饰")?.changeColor(color: UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1))
        kind2?.kindname?.text = "美妆妆饰"
        
        kind3 = KindSelectView(frame: CGRect(x: 0, y: navheight + kindheight*2, width: self.view.frame.width, height: kindheight))
        kind3?.icon?.image = UIImage(named: "文娱体育")?.changeColor(color: UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1))
        kind3?.kindname?.text = "文娱体育"
        
        kind4 = KindSelectView(frame: CGRect(x: 0, y: navheight + kindheight*3, width: self.view.frame.width, height: kindheight))
        kind4?.icon?.image = UIImage(named: "家居家具")?.changeColor(color: UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1))
        kind4?.kindname?.text = "家居家具"
        
        kind5 = KindSelectView(frame: CGRect(x: 0, y: navheight + kindheight*4, width: self.view.frame.width, height: kindheight))
        kind5?.icon?.image = UIImage(named: "电子产品")?.changeColor(color: UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1))
        kind5?.kindname?.text = "电子产品"
        
        kind6 = KindSelectView(frame: CGRect(x: 0, y: navheight + kindheight*5, width: self.view.frame.width, height: kindheight))
        kind6?.icon?.image = UIImage(named: "服装装饰")?.changeColor(color: UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1))
        kind6?.kindname?.text = "服装装饰"
        
        kind7 = KindSelectView(frame: CGRect(x: 0, y: navheight + kindheight*6, width: self.view.frame.width, height: kindheight))
        kind7?.icon?.image = UIImage(named: "旅行住宿")?.changeColor(color: UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1))
        kind7?.kindname?.text = "旅行住宿"
        
        kind8 = KindSelectView(frame: CGRect(x: 0, y: navheight + kindheight*7, width: self.view.frame.width, height: kindheight))
        kind8?.icon?.image = UIImage(named: "饮食保健")?.changeColor(color: UIColor(red: 255/255, green: 64/255, blue: 40/255, alpha: 1))
        kind8?.kindname?.text = "饮食保健"
        
        self.addkindtap(kind: kind1!)
        self.addkindtap(kind: kind2!)
        self.addkindtap(kind: kind3!)
        self.addkindtap(kind: kind4!)
        self.addkindtap(kind: kind5!)
        self.addkindtap(kind: kind6!)
        self.addkindtap(kind: kind7!)
        self.addkindtap(kind: kind8!)
        
        self.view.addSubview(kind1!)
        self.view.addSubview(kind2!)
        self.view.addSubview(kind3!)
        self.view.addSubview(kind4!)
        self.view.addSubview(kind5!)
        self.view.addSubview(kind6!)
        self.view.addSubview(kind7!)
        self.view.addSubview(kind8!)
    }

    func backtoPrevious(){
        self.navigationController!.popViewController(animated: true)
    }
    func selecttap(tap:UITapGestureRecognizer) {
        if tap.view?.tag == 0{
            category?.textfield?.text = "生活百货"
        }else if tap.view?.tag == 1{
            category?.textfield?.text = "美妆妆饰"
        }else if tap.view?.tag == 2{
            category?.textfield?.text = "文娱体育"
        }else if tap.view?.tag == 3{
            category?.textfield?.text = "家居家具"
        }else if tap.view?.tag == 4{
            category?.textfield?.text = "电子产品"
        }else if tap.view?.tag == 5{
            category?.textfield?.text = "服装装饰"
        }else if tap.view?.tag == 6{
            category?.textfield?.text = "旅行住宿"
        }else if tap.view?.tag == 7{
            category?.textfield?.text = "饮食保健"
        }else{
            
        }
        self.backtoPrevious()
    }
    var i = 0
    func addkindtap(kind: KindSelectView){
        kind.isUserInteractionEnabled = true
        kind.tag = i
        let kindtap = UITapGestureRecognizer(target:self, action: #selector( self.selecttap(tap:)))
        kind.addGestureRecognizer(kindtap)
        i = i + 1
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

extension UIImage {
    func scaleToSize(size:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
    
    func changeColor(color:UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)//kCGBlendModeNormal
        context?.setBlendMode(.normal)
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context?.clip(to: rect, mask: self.cgImage!);
        color.setFill()
        context?.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
