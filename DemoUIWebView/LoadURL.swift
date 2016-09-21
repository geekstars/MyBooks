//
//  LoadURL.swift
//  DemoUIWebView
//
//  Created by Hoàng Minh Thành on 9/16/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class LoadURL: UIViewController ,UITextFieldDelegate , UIWebViewDelegate {
    
    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var urlString: UITextField!
    let baseUrl = "http://www."
    override func viewDidLoad() {
        myActivity.hidden = true
        super.viewDidLoad()       
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        myActivity.hidden = false
        let url = NSURL(string: baseUrl + textField.text!)!
        let urlRequest = NSURLRequest(URL: url)
        self.webView.loadRequest(urlRequest)
        myActivity.startAnimating()
        return true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        myActivity.hidden = true
        myActivity.stopAnimating()
    }
    @IBAction func reload(sender: UIButton) {
        webView.reload()
    }
    @IBAction func back(sender: UIButton) {
        webView.goBack()
    }
    
    @IBAction func forward(sender: UIButton) {
        webView.goForward()
    }
    
    
}
