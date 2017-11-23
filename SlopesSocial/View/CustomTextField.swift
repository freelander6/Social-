//
//  CustomTextField.swift
//  SlopesSocial
//
//  Created by George Woolley on 23/11/2017.
//  Copyright © 2017 George Woolley. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(displayP3Red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.3).cgColor
        
        layer.borderWidth = 2
        layer.cornerRadius = 10  
    }

    //Modify ident for input text
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.insetBy(dx: 10, dy: 5)
    }
    
    //Modify indent for placeholder text
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
}
