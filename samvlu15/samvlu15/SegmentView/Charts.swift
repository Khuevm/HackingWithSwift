//
//  ChartViewController.swift
//  samvlu15
//
//  Created by Khue on 22/07/2023.
//

import UIKit

class Charts: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
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
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaceTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell") as! PlaceTableViewCell
        cell.setPlace(places[indexPath.row])
        cell.onRateButtonClicked = {[weak self] rate in
            guard let strongSelf = self else { return }
            strongSelf.places[indexPath.row].rate = rate
            strongSelf.tableView.reloadData()
        }
        return cell
    }
    

}
