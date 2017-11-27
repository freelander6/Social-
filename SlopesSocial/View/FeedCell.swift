//
//  FeedCell.swift
//  SlopesSocial
//
//  Created by George Woolley on 24/11/2017.
//  Copyright © 2017 George Woolley. All rights reserved.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var likeCounter: UILabel!
    
    var post: Post!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(post: Post, img: UIImage?) {
        self.post = post
        self.textField.text = post.caption
        self.likeCounter.text = String(describing: post.likes)

        if img != nil {
            //Image in cache
            self.mainImage.image = img
        } else {
            //Download image
           
                let ref = Storage.storage().reference(forURL: post.imageURL)
            ref.getData(maxSize: 2 * 1024 * 1024, completion: { (data, error) in
                if error != nil {
                    print("A download error has occured: \(String(describing: error))")
                } else {
                    print("Image downloaded")
                    if let imageData = data {
                        if let img = UIImage(data: imageData) {
                            self.mainImage.image = img
                            NewsFeedVC.imageCache.setObject(img, forKey: post.imageURL as NSString)
                        }
                    }
                }
                
            })
            
        }
        
    }
    
   
}

