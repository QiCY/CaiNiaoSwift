//
//  ViewController.swift
//  CaiNiaoSwift
//
//  Created by Mac Os on 16/5/25.
//  Copyright © 2016年 Mac Os. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UIAlertViewDelegate {
    
//    @IBOutlet var btn:UIButton?
//    @IBOutlet var textFiled:UITextField?
//    @IBOutlet var slider:UISlider?
//    @IBOutlet var label:UILabel?
//    
//    
//    @IBAction func btnClicked(sender:UIButton){
//        print("the button clicked")
//    }
    
    var LoginBtn:UIButton?
    var nameText:UITextField?
    var passwordText:UITextField?
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    var dataArray:NSMutableArray = NSMutableArray(capacity: 0)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap = UITapGestureRecognizer(target: self, action: "tapEndEidt")
        self.view.addGestureRecognizer(tap)
        createUI()
    }
    
    func tapEndEidt(){
        self.view.endEditing(true)
    }
    
    func createUI(){
        
        //    nameText 初始化
        nameText = UITextField()
        nameText?.frame = CGRectMake(20, 100, SCREEN_WIDTH - 40, 40)
        nameText?.borderStyle = UITextBorderStyle.RoundedRect
        nameText?.placeholder = "账号"
        nameText?.keyboardType = UIKeyboardType.NamePhonePad
        nameText?.textColor = UIColor.blackColor()
        self.view.addSubview(nameText!)
     
        //    passwordText 初始化
        passwordText = UITextField()
        passwordText?.frame = CGRectMake(20, 160, SCREEN_WIDTH - 40, 40)
        passwordText?.borderStyle = UITextBorderStyle.RoundedRect
        passwordText?.placeholder = "密码"
        passwordText?.keyboardType = UIKeyboardType.NumberPad
        passwordText?.secureTextEntry = true 
        passwordText?.textColor = UIColor.blackColor()
        self.view.addSubview(passwordText!)
        
        
        LoginBtn = UIButton(type: UIButtonType.RoundedRect)
        LoginBtn?.layer.cornerRadius = 5
        LoginBtn?.frame = CGRectMake(20, 220, SCREEN_WIDTH - 40, 40)
        LoginBtn?.setTitle("Login", forState: UIControlState.Normal)
        LoginBtn?.backgroundColor = UIColor.greenColor()
        LoginBtn?.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        LoginBtn?.addTarget(self, action: "loginBtnClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(LoginBtn!)
    
    }
    
    func loginBtnClicked(sender:UIButton){
        
//        let loginAlert = UIAlertView(title: "登录提示", message: "登录成功", delegate: self, cancelButtonTitle: "OK")
//        loginAlert.show()
        showAlertWithOKAndCancel("登录提示", message: "登录成功了", preferredStyle: UIAlertControllerStyle.Alert, cancleBtnTitle: "Cancel", OKBtnTitle: "OK") { (action) -> () in
            if action.style == .Cancel{
                print("点击了Cancel")
            }else if action.style == .Default{
                print("点击了确定")
                let registerView = RegisterViewController()
                self.navigationController?.pushViewController(registerView, animated: true)
            }
        }
       
    }
    
    
    func showAlertWithOKAndCancel(title:String?, message:String?, preferredStyle:UIAlertControllerStyle, cancleBtnTitle:String?, OKBtnTitle:String?, handler:(action:UIAlertAction)->()){
        let alertVC = UIAlertController(title: "登录提示", message: "登录成功了", preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: handler)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: handler)
        
        alertVC.addAction(cancelAction)
        alertVC.addAction(okAction)
        self.presentViewController(alertVC, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}

