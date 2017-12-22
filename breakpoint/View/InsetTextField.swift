//
//  InsetTextField.swift
//  breakpoint
//
//  Created by Donald Belliveau on 2017-12-20.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {
    
    // Instance Variables
    
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    // Functions
    
    /* Awake From Nib Function. */
    override func awakeFromNib() {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        self.attributedPlaceholder = placeholder
        super.awakeFromNib()
    } // END Awake From Nib Function.
    
    
    /* Text Rect Function. */
        //-> For where the Text is held.
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    } // END Text Rect Function.
    
    
    /* Editing Rect Function. */
        //-> Where your editing.
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    } // END Editing Rect Function.
    
    
    /* Placeholder Rect Function. */
        //-> Where your placeholder is.
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    } // END Placeholder Rect Function.
    
    
} // END Class.

