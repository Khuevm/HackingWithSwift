//
//  PhotoCollectionViewCell.swift
//  samvlu13
//
//  Created by Khue on 21/07/2023.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setPhoto(_ photoName: String) {
        photoImageView.image = UIImage(named: photoName)
    }
}
