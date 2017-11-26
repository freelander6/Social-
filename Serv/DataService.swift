//
//  DataService.swift
//  SlopesSocial
//
//  Created by George Woolley on 26/11/2017.
//  Copyright © 2017 George Woolley. All rights reserved.
//

import Foundation
import Firebase

let DB = Database.database().reference()

class DataService {
    
    static let ds = DataService()
    
    private var _DBAref = DB
    private var _DBRrefPosts = DB.child("posts")
    private var _DBRrefUsers = DB.child("users")
    
    var DBAref: DatabaseReference {
        return _DBAref
    }
    
    var DBrefPosts: DatabaseReference {
        return _DBRrefPosts
    }
    
    var DBrefUsers: DatabaseReference {
        return _DBRrefUsers
    }
    
    func createFireDBUser(uid: String, users: Dictionary<String, String>) {
        DBrefUsers.child(uid).updateChildValues(users)
        
    }
}
