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

class NewsFeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
