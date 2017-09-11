//
//  settings.swift
//  Coupon
//
//  Created by macbook on 2017/7/18.
//  Copyright © 2017年 iss. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class settings: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="设置"
    
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 242/255, green: 80/255, blue: 56/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(settings.backToMine))
        self.navigationItem.leftBarButtonItem = leftBarBtn
        leftBarBtn.tintColor = UIColor.white
        
        self.view.backgroundColor = UIColor.white
   
        
        //头像

        
        let image = UILabel(frame: CGRect(x: 20, y: 85, width: 200, height: 30))
        image.textColor = UIColor.black
        image.text = "头像"
        image.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(image)
        
        let theImage = UIImageView(frame: CGRect(x:self.view.bounds.width-60, y:75, width:40 , height: 40))
        theImage.image = UIImage(named:"caotuanzi.jpg")
        self.view.addSubview(theImage)

        let line1 = UIView(frame: CGRect(x:20,y: 120,width: self.view.bounds.width - 40 ,height:1))
        line1.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        self.view.addSubview(line1)
        
        
        //用户名
        
        let userName = UILabel(frame: CGRect(x: 20, y: 130, width: 200, height: 30))
        userName.textColor = UIColor.black
        userName.text = "用户名"
        userName.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(userName)
        
        let theUserName = UILabel(frame: CGRect(x: 300, y: 130, width: 200, height: 30))
        theUserName.textColor = UIColor.gray
        theUserName.text = "明教教主"
        theUserName.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(theUserName)
        
        let line2 = UIView(frame: CGRect(x:20,y: 165,width: self.view.bounds.width - 40 ,height:1))
        line2.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        self.view.addSubview(line2)
        
        //年龄

        let age = UILabel(frame: CGRect(x: 20, y: 175, width: 200, height: 30))
        age.textColor = UIColor.black
        age.text = "年龄"
        age.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(age)
        
        let theAge = UILabel(frame: CGRect(x: 300, y: 175, width: 200, height: 30))
        theAge.textColor = UIColor.gray
        theAge.text = "20"
        theAge.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(theAge)
        
        let line3 = UIView(frame: CGRect(x:20,y: 210,width: self.view.bounds.width - 40 ,height:1))
        line3.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        self.view.addSubview(line3)
        
        //性别

        let gender = UILabel(frame: CGRect(x: 20, y: 220, width: 200, height: 30))
        gender.textColor = UIColor.black
        gender.text = "性别"
        gender.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(gender)
        
        let theGender = UILabel(frame: CGRect(x: 300, y: 220, width: 200, height: 30))
        theGender.textColor = UIColor.gray
        theGender.text = "男"
        theGender.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(theGender)
        
        let line4 = UIView(frame: CGRect(x:20,y: 255,width: self.view.bounds.width - 40 ,height:1))
        line4.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        self.view.addSubview(line4)
    
        //绑定手机号


        let telNum = UILabel(frame: CGRect(x: 20, y: 265, width: 200, height: 30))
        telNum.textColor = UIColor.black
        telNum.text = "绑定手机号"
        telNum.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(telNum)
        
        let theTelNum = UILabel(frame: CGRect(x: 300, y: 265, width: 200, height: 30))
        theTelNum.textColor = UIColor.gray
        theTelNum.text = "01234567890"
        theTelNum.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(theTelNum)
        
        let line5 = UIView(frame: CGRect(x:20,y: 300,width: self.view.bounds.width - 40 ,height:1))
        line5.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        self.view.addSubview(line5)
        
        //修改密码


        //let changePassword = UILabel(frame: CGRect(x: 20, y: 385, width: 200, height: 30))
        //changePassword.textColor = UIColor.black
        //changePassword.text = "修改密码"
        //changePassword.font = UIFont.systemFont(ofSize: 18)
        //self.view.addSubview(changePassword)
 
    
    }
    
    func backToMine(){
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let actionSheet=UIAlertController(title: "上传头像",message: nil,preferredStyle: .actionSheet)
        let cancelBtn=UIAlertAction(title:"取消",style: .cancel,handler: nil)
        let takePhotos=UIAlertAction(title:"拍照",style:.destructive,handler:{
            (action:UIAlertAction)->Void in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let picker=UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self
                picker.allowsEditing = true
                self.present(picker,animated:true,completion:nil)
            }
            else
            {
                print("模拟器中无法打开照相机，请在真机中使用");
            }
        })
        let selectPhotos=UIAlertAction(title:"从相册中选取",style : .default,handler:{
            (action:UIAlertAction)
            ->Void in
            //调用相册功能，打开相册
            let picker=UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate=self
            picker.allowsEditing=true
            self.present(picker,animated:true,completion:nil)
            
        })
        actionSheet.addAction(cancelBtn)
        actionSheet.addAction(takePhotos)
        actionSheet.addAction(selectPhotos)
        self.present(actionSheet,animated:true,completion:nil)
    }

    
    private func imagePickerController(picker:UIImagePickerController,didFinishPickingMediaWithInfo info:[String:AnyObject]){
        let type:String=(info[UIImagePickerControllerMediaType] as! String)
        
        //当选择的类型是图片
        if type=="public.image"
        {
            //修正图片的位置
            //let image = self.fixOrientation(aImage: (info[UIImagePickerControllerOriginalImage] as! UIImage))
            //先把图片转成NSData
            let data = UIImageJPEGRepresentation((info[UIImagePickerControllerOriginalImage] as! UIImage), 0.5)
            
            //图片保存的路径
            //这里将图片放在沙盒的documents文件夹中
            
            //Home目录
            let homeDirectory = NSHomeDirectory()
            let documentPath = homeDirectory + "/Documents"
            //文件管理器
            let fileManager: FileManager = FileManager.default
            //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
            do {
                try fileManager.createDirectory(atPath: documentPath, withIntermediateDirectories: true, attributes: nil)
            }
            //let error-> _
            catch _ {
            }
            fileManager.createFile(atPath: documentPath.appendingFormat("/image.png"), contents: data, attributes: nil)
            //得到选择后沙盒中图片的完整路径
            let filePath: String = String(format: "%@%@", documentPath, "/image.png")
            print("filePath:" + filePath)
  
       /*
            
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                multipartFormData.append(data), withName: "photo_path", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
                for (key, value) in parameters {
                    multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                }
            }, to:"http://server1/upload_img.php")
            { (result) in
                switch result {
                case .success(let upload, _, _):
                    
                    upload.uploadProgress(closure: { (Progress) in
                        print("Upload Progress: \(Progress.fractionCompleted)")
                    })
                    
                    upload.responseJSON { response in
                        //self.delegate?.showSuccessAlert()
                        print(response.request)  // original URL request
                        print(response.response) // URL response
                        print(response.data)     // server data
                        print(response.result)   // result of response serialization
                        //                        self.showSuccesAlert()
                        //self.removeImage("frame", fileExtension: "txt")
                        if let JSON = response.result.value {
                            print("JSON: \(JSON)")
                        }
                    }
                    
                case .failure(let encodingError):
                    //self.delegate?.showFailAlert()
                    print(encodingError)
                }
                
            }
 */
 
         /*
            Alamofire.upload(.POST, "http://www.hangge.com/upload.php", multipartFormData: { multipartFormData in
                let lastData = NSData(contentsOfFile: filePath)
                
                multipartFormData.appendBodyPart(data: lastData!, name: "image")
                
            }, encodingCompletion: { response in
                picker.dismissViewControllerAnimated(true, completion: nil)
                switch response {
                case .Success(let upload, _, _):
                    upload.responseJSON(completionHandler: { (response) in
                        print(response)
                        self.imageView.image = UIImage(data: data!)
                        
                    })
                case .Failure(let encodingError):
                    print(encodingError)
                }
                
            })
           */
          
        }
    }
}
    /*
    func fixOrientation(aImage: UIImage) -> UIImage {
        // No-op if the orientation is already correct
        if aImage.imageOrientation == .up {
            return aImage
        }
        // We need to calculate the proper transformation to make the image upright.
        // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
        var transform: CGAffineTransform = CGAffineTransformIdentity
        switch aImage.imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: aImage.size.width, y: aImage.size.height)
            transform = transform.rotated(by: CGFloat(Double.pi))
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: aImage.size.width, y: 0)
            transform = transform.rotated(by: CGFloat(Double.pi/2))
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: aImage.size.height)
            transform = transform.rotated(by: CGFloat(-Double.pi/2))
        default:
            break
        }
        
        switch aImage.imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: aImage.size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: aImage.size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        default:
            break
        }
        
        // Now we draw the underlying CGImage into a new context, applying the transform
        // calculated above.
        
        
        //这里需要注意下CGImageGetBitmapInfo，它的类型是Int32的，CGImageGetBitmapInfo(aImage.CGImage).rawValue，这样写才不会报错
        let ctx: CGContext = CGContext(data: nil, width: Int(aImage.size.width), height: Int(aImage.size.height), bitsPerComponent: aImage.cgImage!.bitsPerComponent, bytesPerRow: 0, space: aImage.cgImage!.colorSpace!, bitmapInfo: aImage.cgImage!.bitmapInfo.rawValue)!
        ctx.concatenate(transform)
        switch aImage.imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRect(x:0, y:0, width:aImage.size.height, height:aImage.size.width), aImage.cgImage)
        default:
            CGContextDrawImage(ctx, CGRect(x:0, y:0, width:aImage.size.width, height:aImage.size.height), aImage.cgImage)
        }
        
        // And now we just create a new UIImage from the drawing context
        let cgimg: CGImage = ctx.makeImage()!
        let img: UIImage = UIImage(CGImage: cgimg)
        return img
    }
}

    
    
    */
    

