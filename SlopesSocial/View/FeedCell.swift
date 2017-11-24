//
//  FeedCell.swift
//  SlopesSocial
//
//  Created by George Woolley on 24/11/2017.
//  Copyright © 2017 George Woolley. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var likeCounter: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
}
