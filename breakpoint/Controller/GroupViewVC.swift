//
//  GroupViewVC.swift
//  breakpoint
//
//  Created by Donald Belliveau on 2017-12-21.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import UIKit
import Firebase

class GroupViewVC: UIViewController {
    
    // IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var messageTxtField: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    // Instance Variables
    
    var group: Group?
    var groupMessages = [Message]()
    
    // Initializers
    
    /* init Data */
    func initData(forGroup group: Group) {
        self.group = group
    } // END init Data
    
    // Functions
    
    /* View Did Load Function. */
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
    } // END View Did Load Function.
    
    
    /* View Will Appear Function. */
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        groupTitleLbl.text = group?.groupTitle
        DataService.instance.getEmailsForGroup(group: group!) { (returnedEmails) in
            self.membersLbl.text = returnedEmails.joined(separator: ", ")
        }
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllMessagesFor(desiredGroup: self.group!, handler: { (returnedGroupMessages) in
                self.groupMessages = returnedGroupMessages
                self.tableView.reloadData()
                
                if self.groupMessages.count > 0 {
                    self.tableView.scrollToRow(at: IndexPath(row: self.groupMessages.count - 1, section: 0), at: .none, animated: true)
                }
            })
        }
        
    } // END View Will Appear Function.
    
    
    /* Did Receive Memory Warning Function. */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // END Did Receive Memory Warning Function.
    
    
    /* Back Button Was Pressed Function. */
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    } // Back Button Was Pressed Function.
    
    
    /* Send Button Was Pressed Function. */
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if messageTxtField.text != "" {
            //messageTxtField.isEnabled = false
            //sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTxtField.text!, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: group?.key, sendComplete: { (complete) in
                if complete {
                    self.messageTxtField.text = ""
                    self.messageTxtField.isEnabled = true
                    self.sendBtn.isEnabled = true
                }
            })
        }
    } // END Send Button Was Pressed Function.
    
    
} // END Class.


// Extensions

extension GroupViewVC: UITableViewDelegate, UITableViewDataSource {
    
    /* Number Of Sections Function. */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    } // END Number Of Sections Function.
    
    
    /* Number Of Rows In Section Function. */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    } // END Number Of Rows In Section Function.
    
    
    /* Cell For Row At Index Path Function. */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell", for: indexPath) as? GroupFeedCell else { return UITableViewCell() }
        let message = groupMessages[indexPath.row]
        DataService.instance.getUsername(forUID: message.senderId) { (email) in
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: email, content: message.content)
        }
        return cell
    } // END Cell For Row At Index Path Function.
    
    
} // END Extension.

