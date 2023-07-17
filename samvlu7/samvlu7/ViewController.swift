//
//  ViewController.swift
//  samvlu7
//
//  Created by Khue on 17/07/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let defaultGroceries = [
        "Milk", "Apple", "Ham", "Eggs", "Pancakes"
    ]
    
    var groceries = [
        "Milk", "Apple", "Ham", "Eggs", "Pancakes"
    ] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        addRefreshControl()
        
        addEditNavButton()
        addCreateNavButton()
    }
    
    private func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isEditing = false
        tableView.dragDelegate = self
        tableView.dragInteractionEnabled = true
        
    }
    
    private func addRefreshControl(){
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .allEvents)
        tableView.refreshControl = refreshControl
    }
    
    @objc
    func refresh(refreshControl: UIRefreshControl) {
        groceries = defaultGroceries
        
        refreshControl.endRefreshing()
    }
    
    func addEditNavButton() {
            let button = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(handleEditButton))
            navigationItem.leftBarButtonItem = button
        }
        
    @objc
    func handleEditButton() {
        if (self.tableView.isEditing == true) {
            self.tableView.isEditing = false
            
            self.navigationItem.leftBarButtonItem?.title = "Edit"
            self.navigationItem.leftBarButtonItem?.style = .plain
            
        } else {
            self.tableView.isEditing = true
            
            self.navigationItem.leftBarButtonItem?.title = "Done"
            self.navigationItem.leftBarButtonItem?.style = .done
        }
    }
    
    func addCreateNavButton() {
        let button = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(handleCreateButton))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc
    func handleCreateButton() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddVC") as! AddVC
        vc.onTapDoneButton =  {[weak self] item in
            guard let strongSelf = self else { return }
            strongSelf.groceries.insert(item, at: 0)
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = groceries[indexPath.row]
        return [ dragItem ]
    }
    
    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let mover = groceries.remove(at: sourceIndexPath.row)
        groceries.insert(mover, at: destinationIndexPath.row)
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryCell")!
        cell.textLabel?.text = groceries[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groceries.remove(at: indexPath.row)
        }
    }
    
}

