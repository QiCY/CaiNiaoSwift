//
//  ZXGAlertView.swift
//  CaiNiaoSwift
//
//  Created by Mac Os on 16/5/26.
//  Copyright © 2016年 Mac Os. All rights reserved.
//

import UIKit

protocol ZXGAlertViewDelegate{
    
    func zxgAlertViewButtonClicked(buttonIndex:Int, alertView:ZXGAlertView)
}

class ZXGAlertView: UIView {
    
    var delegate:ZXGAlertViewDelegate?
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    var alertView:UIView?
    var titleLabel:UILabel?
    var messageLabel:UILabel?
    var okButton:UIButton?
    var cancelButton:UIButton?
    
    override  init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 0.8)
        let rect = CGRectMake(25, (SCREEN_HEIGHT - 200)/2, SCREEN_WIDTH - 50, 200)
        alertView = UIView(frame:rect)
        alertView?.backgroundColor = UIColor.whiteColor()
        self.addSubview(alertView!)
        
        
        let rectForTitle = CGRectMake(20, 10, rect.size.width - 40, 40)
        titleLabel = UILabel(frame: rectForTitle)
        titleLabel?.textColor = UIColor(red: 226/255, green: 147/255, blue: 175/255, alpha: 1)
        titleLabel?.textAlignment = NSTextAlignment.Center
        titleLabel?.text = "检查更新"
        alertView?.addSubview(titleLabel!)
        
        let rectForMessage = CGRectMake(20, 60, rect.size.width - 40, 80)
        messageLabel = UILabel(frame: rectForMessage)
        messageLabel?.textColor = UIColor.blackColor()
        messageLabel?.textAlignment = NSTextAlignment.Center
        messageLabel?.text = "检测到可用更新，是否更新到2.0版本？"
        messageLabel?.numberOfLines = 2
        alertView?.addSubview(messageLabel!)
        
        let rectForOk = CGRectMake(rect.size.width/2, rect.size.height - 50, rect.size.width/2, 50)
        okButton = UIButton(frame: rectForOk)
        okButton?.setTitle("更新", forState: UIControlState.Normal)
        okButton?.setTitleColor(UIColor(red: 226/255, green: 147/255, blue: 175/255, alpha: 1), forState: UIControlState.Normal)
        okButton?.tag = 100;
        okButton?.addTarget(self, action: "btnClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        alertView?.addSubview(okButton!)
        
        
        let rectForCancel = CGRectMake(0, rect.size.height - 50, rect.size.width/2, 50)
        cancelButton = UIButton(frame: rectForCancel)
        cancelButton?.setTitle("忽略", forState: UIControlState.Normal)
        cancelButton?.setTitleColor(UIColor(red: 226/255, green: 147/255, blue: 175/255, alpha: 1), forState: UIControlState.Normal)
        cancelButton?.tag = 200
        cancelButton?.addTarget(self, action: "btnClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        alertView?.addSubview(cancelButton!)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btnClicked(sender:UIButton){
        if (self.delegate != nil){
            self.delegate?.zxgAlertViewButtonClicked(sender.tag,alertView: self)
        }
        
    }
    func getABool(isRight:Bool){
    
    }

}
