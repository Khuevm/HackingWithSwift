//
//  ListPlaceVC.swift
//  samvlu14
//
//  Created by Khue on 21/07/2023.
//

import UIKit

class ListPlaceVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
        collectionView.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
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

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    
}
