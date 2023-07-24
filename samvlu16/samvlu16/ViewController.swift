//
//  ViewController.swift
//  samvlu16
//
//  Created by Khue on 22/07/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var carImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        carImage.center.x = 80
        print(carImage.center.x)
        print(carImage.center.y)
    }

    @IBAction func carMoveButtonDidTap(_ sender: Any) {
        
        UIView.animateKeyframes(withDuration: 2, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.carImage.transform = self.carImage.transform.translatedBy(x: 300, y: 0)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.5) {
                self.carImage.transform = self.carImage.transform.scaledBy(x: 0.1, y: 0.1)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.carImage.transform = .identity
            }
        }

    }
    
}

