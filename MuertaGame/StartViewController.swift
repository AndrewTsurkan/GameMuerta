//
//  StartViewController.swift
//  New Apps
//
//  Created by Андрей Цуркан on 05.04.2023.
//

import UIKit

class StartViewComtroller: UIViewController {
    
    private let progressBar = UIProgressView()
    private let imageProgressView = UIImageView()
    private let labelCount = UILabel()
    private var procent:Int = 0
    var response: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProgressView()
        setupImageProgressView()
        setupLabel()
        setupTimer()
        view.layer.contents = UIImage(imageLiteralResourceName: "icontop").cgImage
    }
    
    func setupProgressView() {
        imageProgressView.addSubview(progressBar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.setProgress(0, animated: false)
        progressBar.progressViewStyle = UIProgressView.Style.bar
        progressBar.layer.cornerRadius = 40
        progressBar.progressTintColor = .clear
        
        [progressBar.topAnchor.constraint(equalTo: imageProgressView.topAnchor,constant: 30),
         progressBar.leftAnchor.constraint(equalTo: imageProgressView.leftAnchor,constant: 20),
         progressBar.rightAnchor.constraint(equalTo: imageProgressView.rightAnchor,constant: -20),
         progressBar.heightAnchor.constraint(equalToConstant: 30)].forEach{ $0.isActive = true }
    }
    
    func setupImageProgressView() {
        view.addSubview(imageProgressView)
        imageProgressView.translatesAutoresizingMaskIntoConstraints = false
        imageProgressView.image = UIImage(named: "ProgressView")
        
        imageProgressView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageProgressView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 80).isActive = true
    }
    
    func setupLabel() {
        progressBar.addSubview(labelCount)
        labelCount.translatesAutoresizingMaskIntoConstraints = false
        labelCount.textColor = .white
        labelCount.font = UIFont(name: "IrishGrover-Regular", size: 26)
        labelCount.textAlignment = .center
        
        [labelCount.topAnchor.constraint(equalTo: progressBar.topAnchor),
         labelCount.leftAnchor.constraint(equalTo: progressBar.leftAnchor),
         labelCount.rightAnchor.constraint(equalTo: progressBar.rightAnchor)].forEach{ $0.isActive = true }
    }
    
    func setupTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            if self.progressBar.progress != 1 {
                self.progressBar.progress += 1 / 10
                self.procent += 10
                self.labelCount.text = "LOADING \(self.procent)..."
            }else {
                let menuVC = MenuViewController()
                self.navigationController?.pushViewController(menuVC, animated: true)
                timer.invalidate()
            }
        }
    }
}
