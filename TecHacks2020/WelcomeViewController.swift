//
//  StudyViewController.swift
//  TecHacks2020
//
//  Created by Angela Du on 2020-08-15.
//  Copyright © 2020 Angela Du. All rights reserved.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    

    
    override func viewDidLoad() {
        customizeNavBar()
        setupReveal()
        let welcomeLabel: UILabel = {
            let label = UILabel()
            label.text = "Welcome to our app!"
            label.font = UIFont(name: "ChalkboardSE-Bold", size: 18)
            label.textColor = #colorLiteral(red: 0.5704513008, green: 0.4190695227, blue: 0.452945201, alpha: 1)
            return label
        } ()
        let whatDo: UILabel = {
            let label = UILabel()
            label.text = "What would you like to do today?"
            label.font = UIFont(name: "ChalkboardSE-Bold", size: 18)
            label.textColor = #colorLiteral(red: 0.5704513008, green: 0.4190695227, blue: 0.452945201, alpha: 1)
            return label
        } ()
        view.addSubview(welcomeLabel)
        view.addSubview(whatDo)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        whatDo.translatesAutoresizingMaskIntoConstraints = false
        
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        whatDo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        whatDo.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: -2).isActive = true
        
        view.backgroundColor = #colorLiteral(red: 1, green: 0.8352941176, blue: 0.8039215686, alpha: 1)
        
    }
    func customizeNavBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.6784313725, green: 0.6156862745, blue: 0.6156862745, alpha: 1)
        self.navigationItem.title = "Welcome Page"
        self.navigationController!.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "ChalkboardSE-Bold", size: 19)!,
             NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
    }
    
}
