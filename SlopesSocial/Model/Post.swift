//
//  Post.swift
//  SlopesSocial
//
//  Created by George Woolley on 27/11/2017.
//  Copyright © 2017 George Woolley. All rights reserved.
//

import Foundation

class Post {
    
    private var _caption: String!
    private var _imgURL: String!
    private var _likes: Int!
    private var _postID: String!
    
    var caption: String {
        return _caption
    }
    
    var imageURL: String {
        return _imgURL
    }
    
    var likes: Int {
        return _likes
    }
    
    var postID: String {
        return _postID
    }
    
    init(caption: String, imageURL: String, likes: Int) {
        
        self._caption = caption
        self._imgURL = imageURL
        self._likes = likes
    }
    
    init(postID: String, userData: Dictionary<String, AnyObject>) {
        
        self._postID = postID
        
        if let caption = userData["caption"] as? String {
            self._caption = caption
        }
        
        if let imageURL = userData["imageURL"] as? String {
            self._imgURL = imageURL
        }
        
        if let likes = userData["likes"] as? Int {
            self._likes = likes
        }
        
    }
}


