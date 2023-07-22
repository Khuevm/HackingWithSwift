//
//  ViewController.swift
//  samvlu15
//
//  Created by Khue on 22/07/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentView: UIView!
    
    var featureView: Feature!
    var chartView: Charts!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featureView = (UIStoryboard(name: "Feature", bundle: nil).instantiateViewController(withIdentifier: "Feature") as! Feature)
        chartView = (UIStoryboard(name: "Charts", bundle: nil).instantiateViewController(withIdentifier: "Charts") as! Charts)
        segmentView.addSubview(chartView.view)
        segmentView.addSubview(featureView.view)
        
        featureView.view.frame = segmentView.bounds
        chartView.view.frame = segmentView.bounds
        chartView.view.isHidden = true
    }

    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            featureView.view.isHidden = false
            chartView.view.isHidden = true
        case 1:
            featureView.view.isHidden = true
            chartView.view.isHidden = false
        default:
            break
        }
    }
    
    @IBAction func searchButtonDidTap(_ sender: Any) {
        let searchView = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "Search") as! Search
        
        searchView.modalPresentationStyle = .overFullScreen
        self.present(searchView, animated: false)
    }
    
}

