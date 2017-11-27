//
//  NewsFeedVC.swift
//  SlopesSocial
//
//  Created by George Woolley on 24/11/2017.
//  Copyright © 2017 George Woolley. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class NewsFeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var addImage: RoundedView!
    @IBOutlet weak var tableView: UITableView!
    var imagePicker: UIImagePickerController!
    var posts = [Post]()
    static var imageCache: NSCache<NSString, UIImage> = NSCache()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? FeedCell {
            
            if let img = NewsFeedVC.imageCache.object(forKey: post.imageURL as NSString) {
                
                cell.configureCell(post: post, img: img)
                return cell
            } else {
                cell.configureCell(post: post, img: nil)
                return cell
            }
                } else {
            return FeedCell()
        }
  
}
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        
        DataService.ds.DBrefPosts.observe(.value) { (snapshot) in
            
            self.posts = []
            
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    if let dicOfPosts = snap.value as? Dictionary<String,AnyObject> {
                        
                        let key = snap.key
                        
                        let post = Post(postID: key, userData: dicOfPosts)
                        
                        self.posts.append(post)
                       
                    }
                }
                self.tableView.reloadData()
            }
    }

        
        // Do any additional setup after loading the view.
    }
    
    //Once image is selected
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {   //Check that we get an image back from the edited picker
            addImage.image = image
        } else {
            print("Invalid image selected")
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addImageBtnPressed(_ sender: Any) {
         present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func signOutPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toLogin", sender: nil)
        KeychainWrapper.standard.removeObject(forKey: "uid")
        
        let fbLogin = FBSDKLoginManager()
        fbLogin.logOut()
        
        
        try! Auth.auth().signOut()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
