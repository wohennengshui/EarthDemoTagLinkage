//
//  newsVC.swift
//  EarthDemoTagLinkage
//
//  Created by li on 2021/3/21.
//

import Foundation
import UIKit


class newsVC: UIViewController {
    
    lazy var label = UILabel()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .orange
        
        label.frame = CGRect(x: 100, y: 100, width: 300, height: 100)
        label.text = "新闻内容"
        self.view.addSubview(label)
        
    }
}
