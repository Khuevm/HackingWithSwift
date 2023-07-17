//
//  ViewController.swift
//  hacking3
//
//  Created by Khue on 17/07/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var tipPriceLabel: UILabel!
    @IBOutlet weak var tipTitleLabel: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    
    var tipPercent = 0.15 {
        didSet {
            calculate()
        }
    }
    
    var price = 0.0 {
        didSet {
            calculate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDoneButtonOnKeyboard()
    }
    
    func calculate(){
        let tipPercentFormat = Int(tipPercent*100)
        tipTitleLabel.text = "Tip (\(tipPercentFormat)%)"
        
        let tip = tipPercent*price
        tipPriceLabel.text = String(format: "%.2f", tip)
        totalPriceLabel.text = String(format: "%.2f", price+tip)
    }
    
    func addDoneButtonOnKeyboard()
    {
        var doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))

        var flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        var done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneButtonDidTap))

        var items = [UIBarButtonItem()]
        items.append(flexSpace)
        items.append(done)

        doneToolbar.items = items
        doneToolbar.sizeToFit()

        priceTextField.inputAccessoryView = doneToolbar
        priceTextField.inputAccessoryView = doneToolbar

    }
    
    @objc
    func doneButtonDidTap(){
        priceTextField.resignFirstResponder()
        
        price = Double(priceTextField.text!) ?? 0.0
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let sliderValue = String(format: "%.2f", sender.value)
        
        print(sliderValue)
        tipPercent = Double(sliderValue) ?? 0.0
    }
    
}

