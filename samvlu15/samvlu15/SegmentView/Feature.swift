//
//  FeatureViewController.swift
//  samvlu15
//
//  Created by Khue on 22/07/2023.
//

import UIKit

class Feature: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!

    var places: [Place] = [
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "PlaceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlaceCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceCollectionViewCell", for: indexPath) as! PlaceCollectionViewCell
        cell.setPlace(places[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10
        let numberOfItemsInLine: CGFloat = 3
        let cellWidth = (collectionView.frame.width - spacing*(numberOfItemsInLine-1))/numberOfItemsInLine
        return CGSize(width: cellWidth, height: 200)
    }
}
