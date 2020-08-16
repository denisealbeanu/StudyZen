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
        assignbackground()
        
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
        let calendarButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = #colorLiteral(red: 0.8473786485, green: 0.5926962849, blue: 0.5926652958, alpha: 1)
            button.addTarget(self, action: #selector(goCalendar), for: .touchUpInside)
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0.466767132, green: 0.1147519991, blue: 0.1628827654, alpha: 1)
            button.layer.cornerRadius = 35
            button.layer.masksToBounds = true
            button.setTitle("Calendar", for: .normal)
            button.titleLabel?.font = UIFont(name: "ChalkboardSE-Bold", size: 20)
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 275),
                button.heightAnchor.constraint(equalToConstant: 90)
            ])
            return button
        }()
        let studyButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = #colorLiteral(red: 0.8473786485, green: 0.5926962849, blue: 0.5926652958, alpha: 1)
            button.addTarget(self, action: #selector(goStudy), for: .touchUpInside)
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0.466767132, green: 0.1147519991, blue: 0.1628827654, alpha: 1)
            button.layer.cornerRadius = 35
            button.layer.masksToBounds = true
            button.setTitle("Study Tracker", for: .normal)
            button.titleLabel?.font = UIFont(name: "ChalkboardSE-Bold", size: 20)
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 275),
                button.heightAnchor.constraint(equalToConstant: 90)
            ])
            return button
        }()
        let gradeButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = #colorLiteral(red: 0.8473786485, green: 0.5926962849, blue: 0.5926652958, alpha: 1)
            button.addTarget(self, action: #selector(goGrade), for: .touchUpInside)
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0.466767132, green: 0.1147519991, blue: 0.1628827654, alpha: 1)
            button.layer.cornerRadius = 35
            button.layer.masksToBounds = true
            button.setTitle("Grade Tracker", for: .normal)
            button.titleLabel?.font = UIFont(name: "ChalkboardSE-Bold", size: 20)

            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 275),
                button.heightAnchor.constraint(equalToConstant: 90)
            ])
            return button
        }()
        let logButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = #colorLiteral(red: 0.8473786485, green: 0.5926962849, blue: 0.5926652958, alpha: 1)
            button.addTarget(self, action: #selector(goLog), for: .touchUpInside)
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0.466767132, green: 0.1147519991, blue: 0.1628827654, alpha: 1)
            button.layer.cornerRadius = 35
            button.layer.masksToBounds = true
            button.setTitle("Daily Log", for: .normal)
            button.titleLabel?.font = UIFont(name: "ChalkboardSE-Bold", size: 20)

            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 275),
                button.heightAnchor.constraint(equalToConstant: 90)
            ])
            return button
        }()
        
        
        let buttonControlStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.alignment = .center
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            stackView.spacing = 20.0
            stackView.addArrangedSubviews([calendarButton, studyButton, gradeButton, logButton])
            return stackView
        }()
        
        view.addSubview(buttonControlStackView)
        view.addSubview(welcomeLabel)
        view.addSubview(whatDo)
        
        buttonControlStackView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        whatDo.translatesAutoresizingMaskIntoConstraints = false
        
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        whatDo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        whatDo.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 5).isActive = true
        
        buttonControlStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonControlStackView.topAnchor.constraint(equalTo: whatDo.bottomAnchor, constant: 40).isActive = true
        //
        //        buttonControlStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        //        buttonControlStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        //        buttonControlStackView.topAnchor.constraint(equalTo: whatDo.bottomAnchor, constant: 10).isActive = true
        
        // view.backgroundColor = #colorLiteral(red: 1, green: 0.8352941176, blue: 0.8039215686, alpha: 1)
        
    }
    func customizeNavBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.6784313725, green: 0.4086694994, blue: 0.4555973566, alpha: 1)
        self.navigationItem.title = "Welcome Page"
        self.navigationController!.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "ChalkboardSE-Bold", size: 19)!,
             NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
    }
    
    //    let studyTracker = StudyViewController()
    //    let navigationViewController = UINavigationController(rootViewController: studyTracker)
    //    revealViewController()?.pushFrontViewController(navigationViewController, animated: true)
    @objc func goCalendar() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let calendarVC = storyboard.instantiateViewController(withIdentifier: "homeVC")
        let navController = UINavigationController(rootViewController: calendarVC)
        revealViewController()?.pushFrontViewController(navController, animated: true)
    }
    @objc func goStudy() {
        let studyTracker = StudyViewController()
        let navigationViewController = UINavigationController(rootViewController: studyTracker)
        revealViewController()?.pushFrontViewController(navigationViewController, animated: true)
    }
    @objc func goGrade() {
        let storyboard = UIStoryboard(name: "Notes", bundle: nil)
        let calendarVC = storyboard.instantiateViewController(withIdentifier: "notesVC")
        let navigationViewController = UINavigationController(rootViewController: calendarVC)
        revealViewController()?.pushFrontViewController(navigationViewController, animated: true)
    }
    @objc func goLog() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let calendarVC = storyboard.instantiateViewController(withIdentifier: "homeVC")
        let navController = UINavigationController(rootViewController: calendarVC)
        revealViewController()?.pushFrontViewController(navController, animated: true)
    }
    func assignbackground(){
        let background = UIImage(named: "pink.jpg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
}
