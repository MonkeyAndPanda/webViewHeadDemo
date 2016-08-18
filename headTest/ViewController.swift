//
//  ViewController.swift
//  headTest
//
//  Created by 曹小猿 on 16/8/16.
//  Copyright © 2016年 曹小猿. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  @IBAction func click(sender: AnyObject) {
    let webVC = WebViewController.init()
    webVC.title = "web"
    let nav :UINavigationController = UINavigationController.init(rootViewController: webVC)
    self.presentViewController(nav, animated: true) { () -> Void in
      
    }
    }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

