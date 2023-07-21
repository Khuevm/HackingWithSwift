//
//  postTableViewCell.swift
//  samvlu11
//
//  Created by Khue on 19/07/2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setPost(_ post: Post) {
        locationLabel.text = post.location
        titleLabel.text = post.title
        dateLabel.text = post.date
        postImage.image = post.image
    }
}
