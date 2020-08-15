//
//  HomeViewController.swift
//  TecHacks2020
//
//  Created by Angela Du on 2020-08-14.
//  Copyright © 2020 Angela Du. All rights reserved.
//

import Foundation
import UIKit

var dict = [
    "Study time": 0,
    "Total Study Time": 0
]

class HomeViewController: UIViewController {
        
    var label: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    override func viewDidLoad() {
        print("View Loaded")
        
        layoutViews()
        setupReveal()
    }
    
    func layoutViews() {
        view.backgroundColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
