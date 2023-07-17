//
//  SecondVC.swift
//  hacking5
//
//  Created by Khue on 17/07/2023.
//


import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.text = text
    }

}
