//
//  ViewController.swift
//  samvlu9
//
//  Created by Khue on 19/07/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addContacts()
        configTableView()
    }
    
    private func configTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactTableViewCell")
    }
    
    private func addContacts(){
        contacts.append(Contact(name: "Khue1", imageName: "cat1", email: "khue1@gmail.com", phone: "0123456"))
        contacts.append(Contact(name: "Khue2", imageName: "cat2", email: "khue2@gmail.com", phone: "0223456"))
        contacts.append(Contact(name: "Khue3", imageName: "cat3", email: "khue3@gmail.com", phone: "0323456"))
        contacts.append(Contact(name: "Khue4", imageName: "cat3", email: "khue4@gmail.com", phone: "0423456"))
        contacts.append(Contact(name: "Khue5", imageName: "cat2", email: "khue5@gmail.com", phone: "0523456"))
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactVC = self.storyboard?.instantiateViewController(withIdentifier: "ContactView") as! ContactVC
        
        contactVC.setContact(contacts[indexPath.row])
        navigationController?.pushViewController(contactVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as! ContactTableViewCell
        
        cell.setContact(contacts[indexPath.row])
        return cell
    }
    
    
}
