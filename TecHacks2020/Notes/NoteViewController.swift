//
//  NoteViewController.swift
//  notesfinal
//
//  Created by Neha Padala on 8/15/20.
//  Copyright © 2020 Neha Padala. All rights reserved.
//

import UIKit



class NoteViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    
    
    public var noteTitle: String = ""
    public var note: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = noteTitle
        noteLabel.text = note
        
    }
    

 
}
