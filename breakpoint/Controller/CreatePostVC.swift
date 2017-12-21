//
//  CreatePostVC.swift
//  breakpoint
//
//  Created by Donald Belliveau on 2017-12-20.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
    
    // IBOutlets.
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    
    // Functions.
    
    
    /* View Did Load Function. */
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        sendBtn.bindToKeyboard()
    } // END View Did Load Function.
    
    
    /* Did Receive Memory Warning Function. */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // END Did Receive Memory Warning Function.
    
    
    /* Close Button Was Pressed Function. */
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    } // END Close Button Was Pressed Function.
    
    
    /* Send Button Was Pressed Function. */
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if textField.text != nil && textField.text == "Say something here..." {
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: textField.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (isComplete) in
                if isComplete {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendBtn.isEnabled = true
                    print("There was an error!")
                }
            })
        }
    } // END Send Button Was Pressed Function.
    
    
    
    
    
} // END Class.

// Extensions.

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}



























