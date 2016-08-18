//
//  MyURLProtocol.swift
//  headTest
//
//  Created by 曹小猿 on 16/8/16.
//  Copyright © 2016年 曹小猿. All rights reserved.
//

import UIKit

class MyURLProtocol: NSURLProtocol ,NSURLSessionDataDelegate {
  
  
  var session : NSURLSession?
  
  //判断是否拦截
  override class func canInitWithRequest(request: NSURLRequest) -> Bool {
    
    return true

  }
  
  //修改拦截的请求
  override class func canonicalRequestForRequest(request: NSURLRequest) -> NSURLRequest{
    let newRequest : NSMutableURLRequest = request.mutableCopy() as! NSMutableURLRequest
    
    newRequest.addValue("111", forHTTPHeaderField: "ttt")

    return newRequest;
    
  }
  //执行特定的request请求
  override func startLoading() {
    let request = self.request.mutableCopy()
    NSURLProtocol.setProperty((true), forKey: "SessionProtocolKey", inRequest: request as! NSMutableURLRequest)
    
    let config : NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    self.session = NSURLSession.init(configuration: config, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
    let task : NSURLSessionDataTask = self.session!.dataTaskWithRequest(request as! NSURLRequest)
    task.resume()
    
  }
  //取消特定的request请求
  override func stopLoading() {
    
    self.session!.invalidateAndCancel()
    self.session = nil
    
    
  }
  
  //MARK: - NSURLSessionDataDelegate
  func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
    if (error != nil){
      self.client?.URLProtocol(self, didFailWithError: error!)
    }else{
      self.client?.URLProtocolDidFinishLoading(self)
    }
  }
  
  func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveResponse response: NSURLResponse, completionHandler: (NSURLSessionResponseDisposition) -> Void) {
    self.client?.URLProtocol(self, didReceiveResponse: response, cacheStoragePolicy: NSURLCacheStoragePolicy.NotAllowed)
    completionHandler(NSURLSessionResponseDisposition.Allow)
    
  }
  
  func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
    self.client?.URLProtocol(self, didLoadData: data)
  }
  
  func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, willCacheResponse proposedResponse: NSCachedURLResponse, completionHandler: (NSCachedURLResponse?) -> Void) {
    
    completionHandler(proposedResponse)
    
  }


}
