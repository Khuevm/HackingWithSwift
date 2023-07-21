//
//  ViewController.swift
//  samvlu12
//
//  Created by Khue on 21/07/2023.
//

import UIKit

class DateVC: UIViewController {
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var dateFormatter = DateFormatter()
    var timeFormatter = DateFormatter()
    var onTapDoneButton: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavButton()
        
        let currentDate = Date()
        dateFormatter.dateFormat = "MMM d, yyyy"
        timeFormatter.dateFormat = "HH:mm"
        todayLabel.text = "Today: \(dateFormatter.string(from: currentDate))"
    }

    private func addNavButton(){
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(handleDoneButton))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func handleDoneButton(){
        let dateString = dateFormatter.string(from: datePicker.date)
        let timeString = timeFormatter.string(from: timePicker.date)
        
        onTapDoneButton?("\(dateString) \(timeString)")
        navigationController?.popViewController(animated: true)
    }
}

