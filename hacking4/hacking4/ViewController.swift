//
//  ViewController.swift
//  hacking4
//
//  Created by Khue on 17/07/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "MMM d, yyyy HH:mm:ss"
        
        let currentDate = Date()
        dateLabel.text = "\(dateFormatter.string(from: currentDate))"
    }

    @IBAction func refreshButtonDidTap(_ sender: Any) {
        let currentDate = Date()
        dateLabel.text = "\(dateFormatter.string(from: currentDate))"
    }
    
}

