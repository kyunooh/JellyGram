//
//  ViewController.swift
//  JellyGram
//
//  Created by jelly on 15/06/2019.
//  Copyright © 2019 jellyms. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    // UI element storing some image
    @IBOutlet weak var picture: UIImageView!
    
    // first launching functino when app is loaded and shown
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // unwrap / take image file data from UIImageView
        let pictureData = picture.image?.jpegData(compressionQuality: 0.5)
        
        let file = PFFileObject (name: "picture.jpg", data: pictureData!)
        
        // Creat a class / collection / table in Heroku
        // PFObject - to create table or some data in table
        let table = PFObject(className: "message")
        table["seinder"] = "Akhmed"
        table["receiver"] = "Jelly"
        table["picture"] = file
        table.saveInBackground { (success: Bool, error:Error?) in
            if success {
                print("Saved in server")
            } else {
                print(error)
            }
        }
    }

}

