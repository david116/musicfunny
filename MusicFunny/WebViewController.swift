//
//  WebViewController.swift
//  MusicFunny
//
//  Created by leelei on 16/6/14.
//  Copyright © 2016年 leelei. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var urlText: UITextField!
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.cnblogs.com/fanzhidongyzby/archive/2013/03/18/2965859.html")
        // "http://www.childrensmusicworkshop.com/musictheory/lessons/html/id10_en.html")
        // http://www.classicfm.com/discover/music/teach-children-music-theory/
        //let url = NSURL(string: "http://news.sina.com.cn")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        webView.delegate = self
    }
    
    @IBAction func forwardTo(sender: UIButton) {
        // get url from textfield
        let str = urlText.text
        
        // url format
        let url = NSURL(string: str!)
        
        // DO request
        let request = NSURLRequest(URL: url!)
        
        // load
        webView.loadRequest(request)
        
        // close keyboard
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
