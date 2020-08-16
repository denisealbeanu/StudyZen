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
        tableView.register(MenuItemCell.self, forCellReuseIdentifier: cellId)
        
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MenuItemCell
        
        let currentLastItem = products[indexPath.row]
        cell.menuLabel.text = currentLastItem.sectionName
        cell.menuLabel.textColor = .white
        cell.menuLabel.font = UIFont(name: "ChalkboardSE-Bold", size: 23)
        cell.menuImage.image = currentLastItem.sectionImage
        
        view.backgroundColor = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
        
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        } else {
            cell.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }

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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 0 { //Welcome
            let welcome = WelcomeViewController()
            let navigationViewController = UINavigationController(rootViewController: welcome)
            revealViewController()?.pushFrontViewController(navigationViewController, animated: true)
            
        } else if indexPath.row == 1 { //Calendar
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let calendarVC = storyboard.instantiateViewController(withIdentifier: "homeVC")
            let navController = UINavigationController(rootViewController: calendarVC)
            revealViewController()?.pushFrontViewController(navController, animated: true)
            
        } else if indexPath.row == 2 { //Study Tracker
            let studyTracker = StudyViewController()
            let navigationViewController = UINavigationController(rootViewController: studyTracker)
            revealViewController()?.pushFrontViewController(navigationViewController, animated: true)

        } else if indexPath.row == 3 { //Grade Tracker
            let storyboard = UIStoryboard(name: "Notes", bundle: nil)
            let calendarVC = storyboard.instantiateViewController(withIdentifier: "notesVC")
            let navigationViewController = UINavigationController(rootViewController: calendarVC)
            revealViewController()?.pushFrontViewController(navigationViewController, animated: true)
            
        } else if indexPath.row == 4 { //Mood Tracker
            let storyboard = UIStoryboard(name: "Mood", bundle: nil)
            let calendarVC = storyboard.instantiateViewController(withIdentifier: "moodVC") as! UISplitViewController
            calendarVC.delegate = self
            revealViewController()?.pushFrontViewController(calendarVC, animated: true)
            
        }
    }
}

extension MenuViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
           
            return true
        }
        return false
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
