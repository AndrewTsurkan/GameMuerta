//
//  PolicyViewController.swift
//  New Apps
//
//  Created by Андрей Цуркан on 03.04.2023.
//

import UIKit
import WebKit

class PolicyViewController : UIViewController {
    
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupwebView()
        loadRequest()
    }
    
    func setupwebView() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func loadRequest() {
        guard let url = URL(string:"https://clemag-patbok.space/policy.html") else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
}
