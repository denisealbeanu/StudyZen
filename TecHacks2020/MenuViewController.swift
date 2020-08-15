//
//  GradeViewController.swift
//  TecHacks2020
//
//  Created by Angela Du on 2020-08-14.
//  Copyright © 2020 Angela Du. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UITableViewController {
    let cellReuseIdentifier = "cell"

    override func viewDidLoad() {
        layoutViews()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

    }
    
    func layoutViews() {
        view.backgroundColor = .white
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = "asdf"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rootViewController = HomeViewController()
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        revealViewController()?.pushFrontViewController(navigationViewController, animated: true)
    }
}
