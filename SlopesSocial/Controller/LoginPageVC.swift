//
//  ViewController.swift
//  SlopesSocial
//
//  Created by George Woolley on 21/11/2017.
//  Copyright © 2017 George Woolley. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class LoginPageVC: UIViewController {
    
    @IBOutlet weak var emailField: CustomTextField!
    @IBOutlet weak var passwordField: CustomTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facbookBtnPressed(_ sender: Any) {
        
        let fbLogin = FBSDKLoginManager()
        fbLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Authentication error: \(error ?? "" as! Error)")
            }
            else if result?.isCancelled == true {
                    print("User cancelled authentication")
            }
            else {
                print("GEORGE: Success fb login")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
               
                Auth.auth().signIn(with: credential) { (user, err) in           // Checking FB creds
                    if err != nil {
                        print("An error has occured: \(err ?? "" as! Error)")
                        return
                    }
                    print("Successfully signed in FB as:", user ?? "")
                
            }
        }
        
    }
    
}
    @IBAction func emailSignInPressed(_ sender: Any) {
        if let email = emailField.text, let pwd = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {   //user signed in with existing account
                    print("Signed in with existing email")
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("Unable to authenticate with email/password \(error ?? "" as! Error)")
                        } else {
                            print("New user account created and signed in ")
                        }
                    })
                }
            })
            
            
        }
        
        
    }
    

}
