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
    @IBOutlet weak var senderLbl: UILabel!
    @IBOutlet weak var receiverLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    let message = String()
    let receiver = String()
    let sender = String()
    let file = [PFFileObject]()
    
    // first launching functino when app is loaded and shown
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let information = PFQuery(className: "messages")
        information.findObjectsInBackground{ (objects:[PFObject]?, error: Error?) in
            if error == nil {
                for object in objects! {
                    self.messageLbl.text = object["message"] as! String
                    self.receiverLbl.text = object["receiver"] as! String
                    self.senderLbl.text = object["seinder"] as! String
                    if let imageFromParse = object["picture"] as? PFFileObject {
                        imageFromParse.getDataInBackground(block: { (data: Data?, error: Error?) in
                            if error == nil {
                                if data != nil {
                                    self.picture.image = UIImage(data: data!)
                                }
                            }
                        })
                    }
                }
                    
                } else {
                print(error)
            }
        }
    }

}

