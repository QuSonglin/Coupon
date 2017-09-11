//
//  SellViewController.swift
//  hello
//
//  Created by niangniang on 2017/7/16.
//  Copyright © 2017年 niangniang. All rights reserved.
//
import CoreImage
import UIKit

class SellViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

        
        let label = UILabel(frame: CGRect(x: 0, y: self.view.bounds.height/2, width: self.view.bounds.width, height: 30))
        label.text = "请选择添加优惠券的方式"
        label.textAlignment = .center
        label.font = UIFont(name: "Zapfino", size: 18)
        
        
        
        let scanning = UIImageView(frame: CGRect(x:self.view.bounds.width/12,y:self.view.bounds.height/3*2,width:self.view.bounds.width/3*1,height:self.view.bounds.width/3*1))
        let fillinfo = UIImageView(frame: CGRect(x:self.view.bounds.width/12*7,y:self.view.bounds.height/3*2,width:self.view.bounds.width/3*1,height:self.view.bounds.width/3*1))
        //scanning.image = UIImage(named: "test")?.roundCornersToCircle()
        
        let scanimg = UIImage(named: "test")?.resize(toSize: CGSize(width: fillinfo.bounds.width, height: fillinfo.bounds.height))
        scanning.image = scanimg?.roundCornersToCircle()
        
        let fillimg = UIImage(named: "test")?.resize(toSize: CGSize(width: fillinfo.bounds.width, height: fillinfo.bounds.height))
        fillinfo.image = fillimg?.roundCornersToCircle()
        //fillinfo.image = UIImage(named: "iag/test.png")?.roundCornersToCircle()
        
        let scantap = UITapGestureRecognizer(target: self, action:#selector(gotoScanning(_:)))
        scanning.isUserInteractionEnabled = true
        scanning.addGestureRecognizer(scantap)
        
        let filltap = UITapGestureRecognizer(target: self, action:#selector(gotoFilling(_:)))
        fillinfo.isUserInteractionEnabled = true
        fillinfo.addGestureRecognizer(filltap)
        
        
        let backbutton:UIButton = UIButton(type: .custom)
        let backimg = UIImage(named: "x")?.resize(toSize: CGSize(width: backbutton.bounds.width, height: backbutton.bounds.height))
        backbutton.setImage(backimg, for: .normal)
        //backbutton.frame.origin = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/8*7)
        backbutton.frame = CGRect(x: self.view.bounds.width/2 - 10, y: self.view.bounds.height/8*7 - 10, width: 20, height: 20)
        backbutton.addTarget(self, action: #selector(goback(sender:)), for: .touchUpInside)
        
        
        
        self.view.addSubview(label)
        self.view.addSubview(scanning)
        self.view.addSubview(fillinfo)
        self.view.addSubview(backbutton)
        
        // Do any additional setup after loading the view.
    }

    func gotoScanning(_ tap:UITapGestureRecognizer) -> Void{
        let nextvc = Scanning()
        //let scannacv = UINavigationController(rootViewController: nextvc)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.pushViewController(nextvc, animated: true)
        
    }
    func gotoFilling(_ tap:UITapGestureRecognizer)  -> Void{
        let nextvc = FillCouponInfo()
        self.navigationController?.pushViewController(nextvc, animated: true)
        self.navigationController?.navigationBar.isHidden = false
    }
    func goback(sender:UIButton?) -> Void{
        dismiss(animated: true, completion: nil)
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
