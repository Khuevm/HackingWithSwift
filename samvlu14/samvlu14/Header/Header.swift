//
//  Header.swift
//  samvlu14
//
//  Created by Khue on 21/07/2023.
//

import UIKit

class Header: BaseView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let places: [Place] = [
        Place(imageName: "cat1", name: "City1"),
        Place(imageName: "cat2", name: "City2"),
        Place(imageName: "cat3", name: "City3"),
        Place(imageName: "cat1", name: "City1"),
        Place(imageName: "cat2", name: "City2"),
        Place(imageName: "cat3", name: "City3")
    ]
    
    override func commonInit() {
        super.commonInit()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "PlaceHeaderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlaceHeaderCollectionViewCell")
        collectionView.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceHeaderCollectionViewCell", for: indexPath) as! PlaceHeaderCollectionViewCell
        
        cell.setPlace(places[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
