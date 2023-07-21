//
//  DetailViewController.swift
//  samvlu13
//
//  Created by Khue on 21/07/2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var hashtagLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(handleBackButton))
        navigationItem.leftBarButtonItem = backButton
        
        
        guard let post = post else { return }
        navigationItem.title = post.title
        photoImageView.image = UIImage(named: post.photoName)
        detailLabel.text = post.detail
        likeLabel.text = "\(post.likes) likes"
        hashtagLabel.text = post.hashtag
    }
    
    @objc private func handleBackButton(){
        navigationController?.popViewController(animated: true)
    }
}
