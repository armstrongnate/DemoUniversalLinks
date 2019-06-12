//
//  ViewController.swift
//  DemoUniversalLinks
//
//  Created by Nate Armstrong on 6/12/19.
//  Copyright © 2019 armstrongnate. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Canvas", style: .plain, target: self, action: #selector(launch))
    }

    @objc func launch() {
        webView.load(URLRequest(url: URL(string: "http://<host name>:8080/redirect")!))
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url, url.host == "sso.canvaslms.com" {
            UIApplication.shared.open(url)
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
}

