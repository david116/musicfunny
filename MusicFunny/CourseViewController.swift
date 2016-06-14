//
//  CourseViewController.swift
//  MusicFunny
//
//  Created by leelei on 16/6/7.
//  Copyright © 2016年 leelei. All rights reserved.
//


import UIKit

extension UIWebView {
    func loadPDF(name:String!) {
        let termsPath:String? = NSBundle.mainBundle().pathForResource(name, ofType: "pdf")!
        let url = NSURL(fileURLWithPath: termsPath!)
        let pdfRequest = NSURLRequest(URL: url)
        self.loadRequest(pdfRequest)
    }
}

class CourseViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.webView.loadPDF("Music Theory")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


