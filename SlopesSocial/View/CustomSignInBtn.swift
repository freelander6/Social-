//
//  CustomSignInBtn.swift
//  SlopesSocial
//
//  Created by George Woolley on 23/11/2017.
//  Copyright © 2017 George Woolley. All rights reserved.
//

import UIKit

class CustomSignInBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(displayP3Red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.9).cgColor  //add .cgColour
        layer.shadowOpacity = 0.9
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        
        imageView?.contentMode = .scaleAspectFit
        layer.cornerRadius = 10
        
    }

}
