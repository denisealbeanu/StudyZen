//
//  StudyViewController.swift
//  TecHacks2020
//
//  Created by Angela Du on 2020-08-15.
//  Copyright © 2020 Angela Du. All rights reserved.
//

import Foundation
import UIKit


class StudyViewController: UIViewController {
    
    let storage: Storage = UserDefaultsStorage()
    
    lazy var totalTimeLabel: UILabel = {
        let label = UILabel()
        label.text = getTotalTimeText()
        return label
    }()
    
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        let icon = UIImage(systemName: "play")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(icon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        return button
    }()
    
    lazy var pauseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(pauseTimer), for: .touchUpInside)
        let icon = UIImage(systemName: "pause")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(icon, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        return button
    }()
    
    lazy var stopButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        let icon = UIImage(systemName: "stop")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(icon, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        return button
    }()
    
    lazy var buttonControlStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubviews([playButton, pauseButton, stopButton])
        return stackView
    }()
    
    lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.text = self.formatLabel()
        label.font = .systemFont(ofSize: 50, weight: .bold)
        return label
    }()
    
    var seconds: Int = 0
    var minutes: Int = 0
    var hours: Int = 0
    
    var timer: Timer?
    
    override func viewDidLoad() {
        setupReveal()
        view.backgroundColor = .white
        
        layoutViews()
        //Stop by putting -> timer.invalidate()
    }
    
    func layoutViews() {
        view.addSubview(playButton)
        view.addSubview(buttonControlStackView)
        view.addSubview(counterLabel)
        view.addSubview(totalTimeLabel)
        
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        buttonControlStackView.translatesAutoresizingMaskIntoConstraints = false
        totalTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        totalTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        totalTimeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        counterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        buttonControlStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        buttonControlStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        buttonControlStackView.topAnchor.constraint(equalTo: counterLabel.bottomAnchor).isActive = true
    }
    
    @objc func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        playButton.isEnabled = false
    }
    
    @objc func fireTimer() {
        seconds += 1
        if seconds == 60 {
            minutes += 1
            seconds = 0
            if minutes > 59 {
                hours += 1
            }
        }
        DispatchQueue.main.async {
            self.counterLabel.text = self.formatLabel()
        }
    }
    
    func formatLabel() -> String {
        return "\(self.formatNum(self.hours)):\(self.formatNum(self.minutes)):\(self.formatNum(self.seconds))"
    }
    
    func formatNum(_ int: Int) -> String {
        return String(format: "%02d", int)
    }
    
    func timeStudied() -> Int {
        var totalSeconds = 0
        totalSeconds = hours * 3600 + minutes * 60 + seconds
        return totalSeconds
    }
    
    func dequeueSeconds(int: Int) -> (Int, Int, Int) {
        print(int)
        let hours2 = int/3600 //Number of hours
        print(hours2)
        let remainder = int - (3600*hours2)
        print(remainder)
        let minutes2 = remainder/60
        print(minutes2)
        let seconds2 = remainder - (60*minutes2)
        return (hours2, minutes2, seconds2)
    }
    
    @objc func stopTimer() {
        print("Stop")
        timer?.invalidate()
        
        if storage.retrieve(key: "totalTime") == nil {
            storage.store(key: "totalTime", object: 0)
        }
        
        guard let totalTime = storage.retrieve(key: "totalTime") as? Int else { return }
        print(totalTime)
        storage.store(key: "totalTime", object: totalTime + timeStudied())
        
        seconds = 0
        minutes = 0
        hours = 0
        
        self.counterLabel.text = self.formatLabel()
        
            self.totalTimeLabel.text = getTotalTimeText()
            playButton.isEnabled = true
    }
    
    @objc func pauseTimer() {
        timer?.invalidate()
        playButton.isEnabled = true
    }
    
    func getTotalTimeText() -> String {
        guard let totalTime = storage.retrieve(key: "totalTime") as? Int else { return "ERROR" }
        let (h,m,s) = dequeueSeconds(int: totalTime)
        return "Total Time: \(h) hours \(m) minutes \(s) seconds"
    }
}
