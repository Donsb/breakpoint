//
//  LoginVC.swift
//  breakpoint
//
//  Created by Donald Belliveau on 2017-12-20.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    // IBOutlets.
    
    @IBOutlet weak var emailField: UIStackView!
    @IBOutlet weak var passwordField: InsetTextField!
    
    
    // Functions.
    
    
    /* View Did Load Function. */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } // END View Did Load Function.
    
    
    /* Did Receive Memory Warning Function. */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // END Did Receive Memory Warning Function.
    
    
    /* Sign In Button Was Pressed Function. */
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        
    } // END Sign In Button Was Pressed Function.
    
    
    
    /* Close Button Was Pressed Function. */
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        
    } // END Close Button Was Pressed Function.
    
    
    
    
} // END Class.
