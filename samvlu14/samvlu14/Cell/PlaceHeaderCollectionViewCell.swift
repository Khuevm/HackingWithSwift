//
//  PlaceCollectionViewCell.swift
//  samvlu14
//
//  Created by Khue on 21/07/2023.
//

import UIKit

class PlaceHeaderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setPlace(_ place: Place) {
        placeImage.image = UIImage(named: place.imageName)
        placeLabel.text = place.name
    }
}
