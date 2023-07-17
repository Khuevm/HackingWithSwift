//
//  ViewController.swift
//  hacking2
//
//  Created by Khue on 17/07/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func silderValueChanged(_ sender: UISlider) {
        helloLabel.alpha = CGFloat(sender.value)
    }
    
}

