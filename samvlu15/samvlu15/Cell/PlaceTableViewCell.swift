//
//  PlaceTableViewCell.swift
//  samvlu15
//
//  Created by Khue on 22/07/2023.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    
    @IBOutlet weak var rateButton5: UIButton!
    @IBOutlet weak var rateButton4: UIButton!
    @IBOutlet weak var rateButton3: UIButton!
    @IBOutlet weak var rateButton2: UIButton!
    @IBOutlet weak var rateButton1: UIButton!
    
    var rateButtons: [UIButton] = []
    var onRateButtonClicked: ((Int) -> Void)?
    var place: Place!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        rateButtons = [rateButton1, rateButton2, rateButton3, rateButton4, rateButton5]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func rateButtonDidTap(_ sender: UIButton) {
        let rateNum = rateButtons.firstIndex(of: sender) ?? 0
        place.rate = rateNum+1
        
        onRateButtonClicked?(place.rate)
    }
    func setPlace(_ place: Place) {
        self.place = place
        
        placeImage.image = UIImage(named: place.imageName)
        placeLabel.text = place.name
        
        updateRate()
    }
    
    private func updateRate(){
        for i in 0..<place.rate {
            rateButtons[i].setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        
        for i in place.rate..<5 {
            rateButtons[i].setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
}
