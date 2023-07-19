//
//  ContactTableViewCell.swift
//  samvlu9
//
//  Created by Khue on 19/07/2023.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contactImage.layer.cornerRadius = 30
        accessoryType = .disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContact(_ contact: Contact){
        nameLabel.text = contact.name
        contactImage.image = UIImage(named: contact.imageName)
    }
    
}
