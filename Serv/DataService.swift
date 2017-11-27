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
let STORAGE = Storage.storage().reference()

class DataService {
    
    static let ds = DataService()
    
    //dba references
    private var _DBAref = DB
    private var _DBRrefPosts = DB.child("posts")
    private var _DBRrefUsers = DB.child("users")
    
    //storage ref
    private var _REF_POST_IMG = STORAGE.child("post_pics")
    
    var Ref_Post_Img : StorageReference {
        return _REF_POST_IMG
    }
    
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

