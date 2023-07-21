//
//  ViewController.swift
//  samvlu12
//
//  Created by Khue on 21/07/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentDate = Date()
        dateFormatter.dateFormat = "MMM d, yyyy HH:mm"
        dateLabel.text = "\(dateFormatter.string(from: currentDate))"
    }
    
    
    @IBAction func changeDateButtonDidTap(_ sender: Any) {
        let dateVC = storyboard?.instantiateViewController(identifier: "DateView") as! DateVC
        
        dateVC.onTapDoneButton = {[weak self] datePicked in
            self?.dateLabel.text = datePicked
        }
        
        navigationController?.pushViewController(dateVC, animated: true)
    }
}

