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
        
        addNavButton()
        
        guard let post = post else { return }
        navigationItem.title = post.title
        photoImageView.image = UIImage(named: post.photoName)
        detailLabel.text = post.detail
        likeLabel.text = "\(post.likes) likes"
        hashtagLabel.text = post.hashtag
    }
    
    private func addNavButton(){
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(handleBackButton))
        navigationItem.leftBarButtonItem = backButton
        
        let moreButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(handleMoreButton))
        navigationItem.rightBarButtonItem = moreButton
    }
    
    @objc private func handleBackButton(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleMoreButton(){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Report", style: .destructive)
        let action2 = UIAlertAction(title: "Share", style: .default)
        let action3 = UIAlertAction(title: "Save Image", style: .default)
        let action4 = UIAlertAction(title: "Copy Link", style: .default)
        let action5 = UIAlertAction(title: "Cancel", style: .cancel)
        
        
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        alert.addAction(action4)
        alert.addAction(action5)
        
        self.present(alert, animated: true)
    }
}
