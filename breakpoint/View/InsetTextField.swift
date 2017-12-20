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
    
    private var textRectOffset: CGFloat = 20 // Off set amount off the left of the textfield box.
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    // Functions
    
    
    /* Text Rect Function. */
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        //-> For where the Text is held.
    } // END Text Rect Function.
    
    
    /* Editing Rect Function. */
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        //-> Where your editing.
    } // END Editing Rect Function.
    
    
    /* Placeholder Rect Function. */
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        //-> Where your placeholder is.
    } // END Placeholder Rect Function.
    
    
} // END Class.
