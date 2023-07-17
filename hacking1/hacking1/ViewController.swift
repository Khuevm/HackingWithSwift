//
//  ViewController.swift
//  hacking1
//
//  Created by Khue on 17/07/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var tapAndHoldeButton: UIButton!
    
    var number = 0 {
        didSet {
            numberLabel.text = "\(number)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGessture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapAndHoldeButton.addGestureRecognizer(tapGessture)
        
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        tapAndHoldeButton.addGestureRecognizer(longGesture)
        
    }
    
    @objc
    func handleLongPress() {
        number += 1
    }

    @objc
    func handleTap() {
        number += 1
    }
    
    
    
    @IBAction func resetButtonDidTap(_ sender: Any) {
        number = 0
        numberLabel.text = "\(number)"
    }
    
    @IBAction func tapButtonDidTap(_ sender: Any) {
        number += 1
        numberLabel.text = "\(number)"
    }
    
}

