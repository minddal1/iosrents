//
//  ViewController.swift
//  FireBaseHelloWorld
//
//  Created by admin on 28/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var rowNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        var note = CloudStorage.getNoteAt(index: 1)
        
        if note.image != "empty" {
        CloudStorage.downloadImage(name: "note", vc: self)
            
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    var images = [String]()
    
    
    @IBAction func btnClicked(_ sender: Any) {
        CloudStorage.addNote(head: "hello", body: "Alp")
        
    }
    @IBAction func deleteClicked(_ sender: Any) {
        
        CloudStorage.deleteNote(id: "KvuqBv2rJLdOlWHOTd1f")
    }
    
   
    @IBAction func downloadImageClicked(_ sender: Any) {
        CloudStorage.downloadImage(name: images.randomElement()!, vc:self)
    }
    @IBAction func headline(_ sender: Any) {
    }
    
    @IBAction func bodyline(_ sender: Any) {
    }
    
    
}

