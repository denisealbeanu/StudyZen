//
//  UIViewController+Extension.swift
//  TecHacks2020
//
//  Created by Angela Du on 2020-08-15.
//  Copyright © 2020 Angela Du. All rights reserved.
//

import Foundation

extension UIViewController {
    func setupReveal() {
        let menuPic = UIImage(named: "Menu Filled-50")?.withRenderingMode(.alwaysTemplate).withTintColor(.white) //doesnotwork
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuPic, style: .plain, target: revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
//

