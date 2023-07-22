//
//  Search.swift
//  samvlu15
//
//  Created by Khue on 22/07/2023.
//

import UIKit

class Search: UIViewController, UICollectionViewDataSource, UISearchBarDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let places: [Place] = [
        Place(imageName: "cat1", name: "City1"),
        Place(imageName: "cat2", name: "City2"),
        Place(imageName: "cat3", name: "City3"),
        Place(imageName: "cat1", name: "City1"),
        Place(imageName: "cat2", name: "City2"),
        Place(imageName: "cat3", name: "City3"),
        Place(imageName: "cat2", name: "City2"),
        Place(imageName: "cat2", name: "City1"),
        Place(imageName: "cat3", name: "City3"),
        Place(imageName: "cat2", name: "City2"),
        Place(imageName: "cat3", name: "City3"),
        Place(imageName: "cat1", name: "City1"),
        Place(imageName: "cat2", name: "City2"),
        Place(imageName: "cat3", name: "City3"),
        Place(imageName: "cat1", name: "City1"),
        Place(imageName: "cat2", name: "City2"),
        Place(imageName: "cat3", name: "City3"),
        Place(imageName: "cat2", name: "City2"),
        Place(imageName: "cat2", name: "City1"),
        Place(imageName: "cat3", name: "City3"),
        Place(imageName: "cat2", name: "City2"),
        Place(imageName: "cat3", name: "City3")
    ]
    
    var collectionViewPlaces: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.becomeFirstResponder()
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blurEffectView, at: 0)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "PlaceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlaceCollectionViewCell")
        
        searchBar.delegate = self
        searchBar.showsCancelButton = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewPlaces.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceCollectionViewCell", for: indexPath) as! PlaceCollectionViewCell
        cell.setPlace(collectionViewPlaces[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10
        let numberOfItemsInLine: CGFloat = 3
        let cellWidth = (collectionView.frame.width - spacing*(numberOfItemsInLine-1))/numberOfItemsInLine
        return CGSize(width: cellWidth, height: 200)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: false)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        collectionViewPlaces = places.filter { $0.name.contains(searchText) }
        collectionView.reloadData()
    }
}
