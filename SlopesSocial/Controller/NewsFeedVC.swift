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

class NewsFeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? FeedCell {
            cell.configureCell(post: post)
            return cell
        } else {
            return FeedCell()
        }
  
}
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
