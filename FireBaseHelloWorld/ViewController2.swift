//
//  ViewController2.swift
//  FireBaseHelloWorld
//
//  Created by admin on 06/03/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var clickTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickTableView.delegate = self
        clickTableView.dataSource = self
        CloudStorage.startListener(tableView: clickTableView)
        
        
    }
    @IBAction func backbtn(_ sender: Any) {
        performSegue(withIdentifier: "showdetail1", sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CloudStorage.getSize()
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
        cell?.textLabel?.text = CloudStorage.getNoteAt(index: indexPath.row).head
        return cell!
        
        
      }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail1", sender: self)
        
    }
    
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController {
            //destination.rowNumber = clickTableView.indexPathForSelectedRow!.row

        }
    }
    
}
