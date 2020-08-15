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
    let cellId = "cellId"
     var products : [section] = [section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createListArray()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
                

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let currentLastItem = products[indexPath.row]
        cell.textLabel?.text = currentLastItem.sectionName
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont(name: "ChalkboardSE-Bold", size: 23)
        cell.imageView?.image = currentLastItem.sectionImage
        cell.imageView?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        } else {
            cell.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        
        let screenSize: CGRect = UIScreen.main.bounds
        tableView.contentSize.height = screenSize.height/5
        return cell
        }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func createListArray() {
        products.append(section(sectionName: "Welcome", sectionImage: UIImage(named: "idk.png")!))
        products.append(section(sectionName: "Calendar", sectionImage: UIImage(named: "calender.png")!))
        products.append(section(sectionName: "Study Tracker", sectionImage: UIImage(named: "leaf.png")!))
        products.append(section(sectionName: "Grade Tracker", sectionImage: UIImage(named: "calculator.png")!))
        products.append(section(sectionName: "Mood Tracker", sectionImage: UIImage(named: "smile.png")!))
    }
    
    func tableView2(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath as IndexPath) as UITableViewCell

        //configure your cell

        return cell
    }
}
 
//    func layoutViews() {
//        view.backgroundColor = .white
//    }
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//    
    //Default table cell
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
//        cell.textLabel?.text = "asdf"
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let rootViewController = HomeViewController()
//        let navigationViewController = UINavigationController(rootViewController: rootViewController)
//        revealViewController()?.pushFrontViewController(navigationViewController, animated: true)
//    }
    //depending on which row is selected, push which veiw controller
//}
