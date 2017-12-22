//
//  GroupViewVC.swift
//  breakpoint
//
//  Created by Donald Belliveau on 2017-12-21.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import UIKit

class GroupViewVC: UIViewController {
    
    // IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var messageTxtField: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    // Functions
    
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
    
    
    /* Back Button Was Pressed Function. */
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    } // Back Button Was Pressed Function.
    
    
    @IBOutlet weak var sendBtnWasPressed: UIButton!
    
    
} // END Class.
