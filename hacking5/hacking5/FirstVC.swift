//
//  FirstVC.swift
//  hacking5
//
//  Created by Khue on 17/07/2023.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondVC" {
            let secondVC = segue.destination as! SecondVC
            
            secondVC.text = textView.text!
        }
    }
}
