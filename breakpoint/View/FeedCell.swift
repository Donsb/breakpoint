//
//  FeedCell.swift
//  breakpoint
//
//  Created by Donald Belliveau on 2017-12-21.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    // IBOutlets.
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    // Functions.
    
    
    /* Configure Cell Function. */
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    } // END Configure Cell Function.
    
    
} // END Class.
