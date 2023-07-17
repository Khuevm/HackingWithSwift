//
//  AddVC.swift
//  samvlu7
//
//  Created by Khue on 17/07/2023.
//

import UIKit

typealias CallBack =  ((String) -> Void)
typealias CallBackV2<T> = ((T) ->  Void)

class AddVC: UIViewController {
    
    var onTapDoneButton: CallBackV2<String>?
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addDoneNavButton()
    }
    
    func addDoneNavButton() {
        let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(handleCreateButton))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc
    func handleCreateButton() {
        onTapDoneButton?(textView.text)
        navigationController?.popViewController(animated: true)
    }
}
