//
//  ContactTableViewCell.swift
//  TextingApp
//
//  Created by stagiaire on 19/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func display(contact:Contact) {
       nameLabel.text = contact.uid
        
    }

}
