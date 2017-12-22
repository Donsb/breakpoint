//
//  ShadowView.swift
//  breakpoint
//
//  Created by Donald Belliveau on 2017-12-20.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    // Functions.
    
    /* Awake From Nib Function. */
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5 // Makes it look like the view is floating off the screen.
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        super.awakeFromNib()
    } // END Awake From Nib Function.
    
    
} // END Class.
