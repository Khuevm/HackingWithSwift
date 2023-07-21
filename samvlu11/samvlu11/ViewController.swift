//
//  ViewController.swift
//  samvlu11
//
//  Created by Khue on 19/07/2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var imagePicker = UIImagePickerController()
    var locationManager = CLLocationManager()
    
    var post = Post()
    var onTapDoneButton: ((Post) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        locationManager.delegate = self
        
        addButtonOnKeyboard()
        addNavButton()
        configDateLabel()
    }

    func configDateLabel(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
                
        let currentDate = Date()
        let dateFormatted = dateFormatter.string(from: currentDate)
        dateLabel.text = "\(dateFormatted)"
        post.date = dateFormatted
    }
    
    //ToolBar
    func addButtonOnKeyboard(){
        let keyboardToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 60))
        
        let camera = UIBarButtonItem(image: UIImage(systemName: "camera.fill"), style: .plain, target: self, action: #selector(cameraButtonDidTap))
        let location = UIBarButtonItem(image: UIImage(systemName: "location.fill"), style: .plain, target: self, action: #selector(locationButtonDidTap))

        let locationLabel = UIBarButtonItem(title: post.location, style: .plain, target: self, action: nil)
        locationLabel.tintColor = .systemGray
        locationLabel.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)
            
        ], for: .normal)
        
        let imageView = UIBarButtonItem(image: post.image?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        
        var items = [UIBarButtonItem()]
        items.append(camera)
        items.append(location)
        items.append(UIBarButtonItem.flexibleSpace())
        items.append(locationLabel)
        items.append(imageView)

        keyboardToolbar.items = items
        keyboardToolbar.sizeToFit()
        keyboardToolbar.tintColor = .systemGreen

        textView.inputAccessoryView = keyboardToolbar
    }
    
    @objc
    func cameraButtonDidTap(){
        textView.resignFirstResponder()
        
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePicker, animated: true)
    }
    
    @objc
    func locationButtonDidTap(){
        textView.resignFirstResponder()
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    //NavButton
    func addNavButton() {
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(handleDoneButton))
        navigationItem.rightBarButtonItem = doneButton
    }
            
    @objc
    func handleDoneButton() {
        post.title = textView.text.trimmingCharacters(in: .whitespacesAndNewlines)
        if !post.title!.isEmpty && post.image != nil {
            onTapDoneButton?(post)
        }
        navigationController?.popViewController(animated: true)
    }

}

extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("image")
        
        post.image = info[.originalImage] as? UIImage
        addButtonOnKeyboard()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        //Convert lat lon to get address
        let ceo = CLGeocoder()
        ceo.reverseGeocodeLocation(locations.first!) { placemark, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            if let pm = placemark?.first {
                let country = pm.country!
                let locality = pm.locality!
                
                self.post.location = "\(locality), \(country)"
                self.addButtonOnKeyboard()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
