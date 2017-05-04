//
//  ViewController.swift
//  webView
//
//  Created by Emilee Duquette on 5/2/17.
//  Copyright © 2017 Ryan Petrill. All rights reserved.
//

import UIKit
import WebKit //Must import to get WK Web View

class ViewController: UIViewController {

    var webView:WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView = WKWebView()
        view.addSubview(webView)
    //    webView.loadHTMLString("<h1>Title</h1><p>paragraph</p>", baseURL: nil) // file from URL String
   /*     let url:URL = Bundle.main.url(forResource: "page", withExtension: "html")! //Loads URL based on file
        let request:URLRequest = URLRequest(url: url)
        webView.load(request) */
	
        
        
        //SET DIMENSIONS OF WEBVIEW WITH AUTOLAYOUT HAVE TO DO THIS AFTER ADDED TO SUBVIEW
        webView.translatesAutoresizingMaskIntoConstraints = false //Says I don't want to use a frame
        let width = NSLayoutConstraint(item: webView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: webView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: -60)
        let top = NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 60)
        view.addConstraints([width, height, top])
        
        //adds in constraints based on the PARENT WINDOW. constant is like an offset of the parent window added 20 from the top to move down under the battery bar and subtracted 20 from the bottom to stop it from cutting off after changing the top constraint.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goBack(_ sender: UIButton) {
        webView.goBack()
    }
    
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
        let url:URL = URL(string: textfield.text!)!
        let req:URLRequest = URLRequest(url: url)
        webView.load(req)
        textfield.resignFirstResponder() //Dismisses the KeyBoard after it pops up
        return false
    }


}

