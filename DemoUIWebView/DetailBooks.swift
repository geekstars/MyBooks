//
//  DetailBooks.swift
//  DemoUIWebView
//
//  Created by Hoàng Minh Thành on 9/16/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class DetailBooks: UIViewController , UIWebViewDelegate {

    @IBOutlet weak var btn_getTime: UIButton!
    @IBOutlet weak var myActive: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
    var urlString : String!
    var type: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = urlString
        self.webView.delegate = self
        self.myActive.startAnimating()
        var urlpath = "default"
        switch type {
            case "PDF" :
                urlpath = NSBundle.mainBundle().pathForResource(urlString, ofType: "pdf")!
                self.btn_getTime.hidden = true
            case "DOCX" :
                urlpath = NSBundle.mainBundle().pathForResource(urlString, ofType: "docx")!
                self.btn_getTime.hidden = true
            case "HTML" :
                urlpath = NSBundle.mainBundle().pathForResource(urlString, ofType: "html")!
                self.btn_getTime.hidden = false
            default: break
        }
        let url: NSURL = NSURL.fileURLWithPath(urlpath)
        let urlRequest = NSURLRequest(URL: url)
        self.webView.loadRequest(urlRequest)
        self.webView.scalesPageToFit = true
    }
    
    @IBAction func getCurrentTime(sender: AnyObject) {
        self.webView.stringByEvaluatingJavaScriptFromString("hello();")
    }
    func webViewDidStartLoad(webView: UIWebView) {
        
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        return true
    }
    
    @IBAction func reload(sender: UIButton) {
        webView.reload()
    }
    
    @IBAction func forward(sender: UIButton) {
        webView.goForward()
    }
    
    @IBAction func back(sender: UIButton) {
        webView.goBack()
    }
    
}
