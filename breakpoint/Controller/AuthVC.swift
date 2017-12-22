//
//  AuthVC.swift
//  breakpoint
//
//  Created by Donald Belliveau on 2017-12-20.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {
    
    // Functions.
    
    /* View Did Load Function. */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    } // END View Did Load Function.
    
    
    /* View Did Appear Function. */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    } // END View Did Appear Function.
    
    
    /* Did Receive Memory Warning Function. */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // END Did Receive Memory Warning Function.
    
    
    /* Signin With Email Button Was Pressed Function. */
    @IBAction func signInWithEmailBtnPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    } // END Signin With Email Button Was Pressed Function.
    
    
    /* Google Signin Button Was Pressed Function. */
    @IBAction func googleSigninBtnWasPressed(_ sender: Any) {
        
        // Challenge
        
    } // END Google Signin Button Was Pressed Function.
    
    
    /* FaceBook Signin Button Was Pressed Function. */
    @IBAction func facebookSigninBtnWasPressed(_ sender: Any) {
        
        // Challenge
        
    }// END FaceBook Signin Button Was Pressed Function.
    
    
} // END Class.
