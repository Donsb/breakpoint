//
//  CreateGroupsVC.swift
//  breakpoint
//
//  Created by Donald Belliveau on 2017-12-21.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {
    
    // IBOutlets.
    
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupMemberLbl: UILabel!
    
    
    // Functions.
    
    
    /* View Did Load Function. */
    override func viewDidLoad() {
        super.viewDidLoad()
    } // END iew Did Load Function.
    
    
    /* Did Receive Memory Warning Function. */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // END Did Receive Memory Warning Function.
    
    
    /* Done Button Was Pressed Function. */
    @IBAction func doneBtnWasPressed(_ sender: Any) {
        
    } // END Done Button Was Pressed Function.
    
    
    /* Close Button Was Pressed Function. */
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        
    } // END Close Button Was Pressed Function.
    
    
} // END Class.






















