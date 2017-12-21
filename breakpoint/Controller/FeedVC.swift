//
//  FeedVC.swift
//  breakpoint
//
//  Created by Donald Belliveau on 2017-12-19.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    
    // IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // Instance Variables.
    
    var messageArray = [Message]()
    
    // Functions.
    
    
    /* View Did Load Function. */
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    } // END View Did Load Function.
    
    
    /* View Did Appear Function. */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeeMessages { (returnedMessagesArray) in
            self.messageArray = returnedMessagesArray
            self.tableView.reloadData()
        }
    } // END View Did Appear Function.
    
    
    /* Did Receive Memory Warning Function. */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // END Did Receive Memory Warning Function.
    
    
} // End Class.

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else { return UITableViewCell() }
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        
        cell.configureCell(profileImage: image!, email: message.senderId, content: message.content)
        return cell
    }
    
}

























