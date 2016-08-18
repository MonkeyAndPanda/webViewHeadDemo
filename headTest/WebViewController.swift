//
//  WebViewController.swift
//  headTest
//
//  Created by 曹小猿 on 16/8/16.
//  Copyright © 2016年 曹小猿. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
  var webView:UIWebView?

    override func viewDidLoad() {
        super.viewDidLoad()
      //注册URLProtocol
      NSURLProtocol.registerClass(MyURLProtocol)
      //设置UI
      self.setControll()
      //提出请求
      self.loadRequest()
  
    }
  func loadRequest(){
    
    
    //https://www.baidu.com
    //http://www.jianshu.com/p/1bbdee89ead8/comments/3648886#comment-3648886
    let url  = NSURL.init(string: "http://www.jianshu.com/p/1bbdee89ead8/comments/3648886#comment-3648886")!
    
    self.webView?.loadRequest(NSURLRequest.init(URL: url))
  
    
  }
  
  func setControll(){
    
    self.webView = UIWebView.init(frame: self.view.bounds)
    self.view.addSubview(self.webView!)
  
    let btn = UIButton.init(frame: CGRectMake(0, 0, 40, 35/2))
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
    btn.setTitle("关闭", forState: UIControlState.Normal)
    btn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
    btn.titleLabel?.font = UIFont.systemFontOfSize(15)
    btn.addTarget(self, action: Selector("pressClose"), forControlEvents: .TouchUpInside)
    let item2 = UIBarButtonItem.init(customView: btn)
    self.navigationItem.leftBarButtonItems = [item2]

  }
  
  func pressClose(){
  
    self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
  }

  deinit{
    
    NSURLProtocol.unregisterClass(MyURLProtocol)
  }
}
  




