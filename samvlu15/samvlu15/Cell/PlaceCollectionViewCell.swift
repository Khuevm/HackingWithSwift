//
//  PlaceCollectionViewCell.swift
//  samvlu14
//
//  Created by Khue on 21/07/2023.
//

import UIKit

class PlaceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setPlace(_ place: Place) {
        placeImage.image = UIImage(named: place.imageName)
        placeLabel.text = place.name
    }
}
