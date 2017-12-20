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
    
    
    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    
    
    // Functions.
    
    
    /* View Did Load Function. */
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
    } // END View Did Load Function.
    
    
    /* Did Receive Memory Warning Function. */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // END Did Receive Memory Warning Function.
    
    
    /* Sign In Button Was Pressed Function. */
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        
        if emailField.text != nil && passwordField.text != nil {
            
            // Try to sign in.
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                
                // If can't log in, use the info the user entered and try to register user.
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrtationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("Successfully registered user")
                        })
                    } else {
                        print(String(describing: registrtationError?.localizedDescription))
                    }
                })
            })
        }
        
        
    } // END Sign In Button Was Pressed Function.
    
    
    
    /* Close Button Was Pressed Function. */
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    } // END Close Button Was Pressed Function.
    
    
    
    
} // END Class.


//

extension LoginVC: UITextFieldDelegate {
    
}
















