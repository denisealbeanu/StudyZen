//
//  ViewController.swift
//  notesfinal
//
//  Created by Neha Padala on 8/15/20.
//  Copyright © 2020 Neha Padala. All rights reserved.
//

import UIKit

class NotesMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var lable: UILabel!
    
    var models: [(title: String, note: String)] = []
    
    override func viewDidLoad() {
        customizeNavBar()
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        view.backgroundColor = #colorLiteral(red: 0.779467325, green: 0.9345891895, blue: 1, alpha: 1)
        title = "Classes"
        setupReveal()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(didTapNewNote))
        
    }
    
    @objc func didTapNewNote(){
        
        let storyboard = UIStoryboard(name: "Notes", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "new") as! EntryViewController

        vc.title = "New Class"
        vc.navigationItem.largeTitleDisplayMode = .never
        
        vc.completion = { [weak self] noteTitle, note in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popToRootViewController(animated: true)
            strongSelf.models.append((title: noteTitle, note: note))
            strongSelf.lable.isHidden = true
            strongSelf.table.isHidden = false
            strongSelf.table.reloadData()
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        cell.textLabel?.textColor = .black
        cell.backgroundColor = .systemYellow
        cell.contentView.backgroundColor = .systemYellow
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = models[indexPath.row]
        
        
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? NoteViewController else{
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Class"
        vc.noteTitle = model.title
        vc.note = model.note
        
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.beginUpdates()
            models.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        }
    }
    func customizeNavBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1607843137, green: 0.4156862745, blue: 0.568627451, alpha: 1)
        self.navigationItem.title = "Welcome Page"
        self.navigationController!.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "ChalkboardSE-Bold", size: 19)!,
             NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
    }
    
}

