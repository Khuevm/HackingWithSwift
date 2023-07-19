//
//  ContactVC.swift
//  samvlu9
//
//  Created by Khue on 19/07/2023.
//

import UIKit

class ContactVC: UIViewController {
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactImage.layer.cornerRadius = 50
        
        if let contact = contact {
            contactImage.image = UIImage(named: contact.imageName)
            nameLabel.text = contact.name
            phoneLabel.text = contact.phone
            emailLabel.text = contact.email
        }
    }
    
    func setContact(_ contact: Contact) {
        self.contact = contact
    }
}
