//
//  JellyGramViewController.swift
//  JellyGram
//
//  Created by jelly on 19/06/2019.
//  Copyright © 2019 jellyms. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class JellyGramViewController: UITableViewController {

    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request("https://jsonplaceholder.typicode.com/posts").responseArray {  (response: DataResponse<[Post]>) in
            self.posts = response.result.value!
            self.posts.forEach {(post: Post) in
                Alamofire.request("https://jsonplaceholder.typicode.com/users/\(Int(post.userId))").responseObject { (response: DataResponse<User>) in
                    post.username = response.result.value!.username
                    self.tableView.reloadData()
                }
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        
        let post = posts[indexPath.row]

        cell.usernameLabel.text = post.username
        cell.contentLbl.text = post.body
        
        return cell
    }
 

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImageView {
    func downloadImageFrom(_ link:String, contentMode: UIView.ContentMode) {
        URLSession.shared.dataTask( with: URL(string:link)!, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) }
            }
        }).resume()
    }
    
    func downloadAndResizeImageFrom(_ link:String, contentMode: UIView.ContentMode ,newWidth:CGFloat) {
        URLSession.shared.dataTask( with: URL(string:link)!, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                if let data = data {
                    if let tempImage = UIImage(data: data){
                        let scale = newWidth / tempImage.size.width
                        let newHeight = tempImage.size.height * scale
                        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
                        tempImage.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
                        let newImage = UIGraphicsGetImageFromCurrentImageContext()
                        UIGraphicsEndImageContext()
                        self.image = newImage
                    }
                }
            }
        }).resume()
    }
}
