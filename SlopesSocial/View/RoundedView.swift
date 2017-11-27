//
//  RoundedView.swift
//  SlopesSocial
//
//  Created by George Woolley on 24/11/2017.
//  Copyright © 2017 George Woolley. All rights reserved.
//

import UIKit

class RoundedView: UIImageView{

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(displayP3Red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.9).cgColor  //add .cgColour
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        
      
        layer.cornerRadius = 15   //Makes corners round instead of whole btn round
        clipsToBounds = true
    }
    
//    //   Width of frame hasnt been calced in awakfromNib yet
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        layer.cornerRadius = frame.size.width/2
//
//
//
//    }

}
