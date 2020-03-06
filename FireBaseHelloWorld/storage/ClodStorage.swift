//
//  ClodStorage.swift
//  FireBaseHelloWorld
//
//  Created by admin on 28/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

class CloudStorage {
    
    private static var list = [Note]()
    private static let db = Firestore.firestore()
    private static let notes = "notes"
    private static let storage = Storage.storage() // get the instance
    
    static func downloadImage(name:String, vc:ViewController){
        let imgRef = storage.reference(withPath: name)
        imgRef.getData(maxSize: 7000000) { (data, error) in
            if error == nil {
            print("success downloading image.")
            let img = UIImage(data: data!)
            DispatchQueue.main.async { // prevent background thread from interruupting the main thread
                vc.imageView.image = img
                }
            } else {
                print("error \(error?.localizedDescription)")
            }
        }
    }
    static func getSize() -> Int {
        return list.count
    }
    
    static func getNoteAt(index:Int) -> Note {
        return list[index]
    }
    
    static func startListener(tableView:UITableView){
        print("Starting listener")
        db.collection(notes).addSnapshotListener { (snap, error) in
            if error == nil {
                self.list.removeAll()   // clears the list
                for note in snap!.documents {
                    let map = note.data()
                    let head = map["head"] as! String
                    let body = map["body"] as? String ?? "tom"
                    let newNote = Note(id: note.documentID, head: head, body: body)
                    self.list.append(newNote)
    
                }
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
            }
        }
        
    }
    static func deleteNote(id:String) {
        let docRef = db.collection(notes).document(id)
        docRef.delete()
    
    }
        static func addNote(head:String, body:String) {
        let ref = db.collection(notes).document()
        var map = [String: String]()
        map["head"] = head
        map["body"] = body
        ref.setData(map)
                    
        
        }
        
    
    static func updateNote(index:Int, head:String, body:String) {
        let note = list[index]
        let docRef = db.collection(notes).document(note.id)
        var map = [String: String]()
        map["head"] = head
        map["body"] = body
        docRef.setData(map)
    }
    
}

