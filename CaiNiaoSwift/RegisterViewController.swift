//
//  RegisterViewController.swift
//  CaiNiaoSwift
//
//  Created by Mac Os on 16/5/26.
//  Copyright © 2016年 Mac Os. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ZXGAlertViewDelegate{
    
    var tableView:UITableView?
    var dataArray:NSMutableArray?
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    
    
    
     override func  viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "TableView"
        dataArray = NSMutableArray(array: ["UIPickerView","UIScrollView","UIImageView","UIPageView","UIProgressView"])
        
        createTableView()
    }
    
    func createTableView(){
        tableView = UITableView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64), style: UITableViewStyle.Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
        self.view.addSubview(tableView!)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataArray?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellid = "cellid"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellid)
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellid)
        }
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        cell?.textLabel?.text = dataArray![indexPath.row] as? String
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let zxgAlertView = ZXGAlertView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        zxgAlertView.delegate = self
        
//        zxAlertView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
//        
        self.view.addSubview(zxgAlertView)
//        self .presentViewController(zxAlertView, animated: false, completion: nil)
        
    }
    func zxgAlertViewButtonClicked(buttonIndex: Int, alertView:ZXGAlertView) {
        if buttonIndex == 100
        {
            print("点击了更新")
        }
        if buttonIndex == 200
        {
            print("点击了忽略")
        }
        
        alertView.removeFromSuperview()
    }
}
