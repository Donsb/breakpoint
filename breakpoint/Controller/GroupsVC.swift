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
    
    // Functions
    
    
    /* View Did Load Function. */
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    } // END View Did Load Function.
    
    
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
        return 3
    } // END Number Of Rows In Section Function.
    
    
    /* Cell For Row At Function. */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell else { return UITableViewCell() }
        cell.configureCell(title: "Nerd Herd", description: "The nrediest nerss around.", memberCount: 3)
        return cell
    } // END Cell For Row At Function.
    
} // END Extension.


















