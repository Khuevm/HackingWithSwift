//
//  ViewController.swift
//  samvlu13
//
//  Created by Khue on 21/07/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPosts()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
    }
    
    private func addPosts(){
        posts.append(Post(title: "Cat 1", photoName: "cat1", detail: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ", likes: 215, hashtag: "#cat #cute"))
        posts.append(Post(title: "Cat 2", photoName: "cat2", detail: "2 Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", likes: 2, hashtag: "#cat"))
        posts.append(Post(title: "Cat 3", photoName: "cat3", detail: "hihihihihihihi2", likes: 3, hashtag: "#cat"))
        posts.append(Post(title: "Cat 4", photoName: "cat2", detail: "hihihihihihihi3", likes: 40, hashtag: "#cat"))
        posts.append(Post(title: "Cat 5", photoName: "cat3", detail: "hihihihihihihi4", likes: 54, hashtag: "#cat"))
        posts.append(Post(title: "Cat 6", photoName: "cat1", detail: "5 Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", likes: 666, hashtag: "#cat"))
        posts.append(Post(title: "Cat 7", photoName: "cat3", detail: "hihihihihihihi6", likes: 7, hashtag: "#cat"))
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.setPhoto(posts[indexPath.row].photoName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width) / 3
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "DetailView") as! DetailViewController
        detailVC.post = posts[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
