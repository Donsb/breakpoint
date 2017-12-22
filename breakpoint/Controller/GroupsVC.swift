//
//  GroupsVC.swift
//  breakpoint
//
//  Created by Donald Belliveau on 2017-12-19.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {
    
    // IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // Instance Variables
    
    var groupsArray = [Group]()
    
    // Functions
    
    /* View Did Load Function. */
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    } // END View Did Load Function.
    
    
    /* View Did Appear Function. */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroups { (returnedGroupsArray) in
                self.groupsArray = returnedGroupsArray
                self.tableView.reloadData()
            }
        }
    } // END View Did Appear Function.
    
    
    /* Did Receive Memory Warning Function. */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // END Did Receive Memory Warning Function.
    
    
} // END Class.


// Extensions

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    
    /* Number Of Sections Function. */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    } // END Number Of Sections Function.
    
    
    /* Number Of Rows In Section Function. */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    } // END Number Of Rows In Section Function.
    
    
    /* Cell For Row At Function. */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell else { return UITableViewCell() }
        let group = groupsArray[indexPath.row]
        cell.configureCell(title: group.groupTitle, description: group.groupDescription, memberCount: group.memberCount)
        return cell
    } // END Cell For Row At Function.
    
    
    /*  */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupFeedVC = storyboard?.instantiateViewController(withIdentifier: "GroupViewVC") as? GroupViewVC else { return }
        present(groupFeedVC, animated: true, completion: nil)
    }
    
} // END Extension.


















