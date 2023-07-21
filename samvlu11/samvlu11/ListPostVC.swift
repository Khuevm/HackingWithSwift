//
//  ListPostVC.swift
//  samvlu11
//
//  Created by Khue on 19/07/2023.
//

import UIKit

class ListPostVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPost()
        addButtonNav()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
    }
    
    private func addButtonNav(){
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(handleAddButton))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc
    private func handleAddButton(){
        let addVC = storyboard?.instantiateViewController(withIdentifier: "AddPostView") as! ViewController
        navigationController?.pushViewController(addVC, animated: true)
        
        addVC.onTapDoneButton =  {[weak self] post in
            guard let strongSelf = self else { return }
            strongSelf.posts.insert(post, at: 0)
            strongSelf.tableView.reloadData()
            
        }
    }
    
    private func addPost(){
        posts.append(Post(image: UIImage(named: "cat1")!, title: "hihihihihihihi", date: "Jul 19, 2021", location: "Hanoi, Vietnam"))
        posts.append(Post(image: UIImage(named: "cat2")!, title: "hihihihihihihi1", date: "Jul 12, 2021"))
        posts.append(Post(image: UIImage(named: "cat3")!, title: "hihihihihihihi2", date: "Jul 13, 2021"))
        posts.append(Post(image: UIImage(named: "cat3")!, title: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", date: "Jul 14, 2021", location: "HCM, Vietnam"))
        posts.append(Post(image: UIImage(named: "cat1")!, title: "hihihihihihihi4", date: "Jul 15, 2021"))
        posts.append(Post(image: UIImage(named: "cat2")!, title: "hihihihihihihi5", date: "Jul 16, 2021"))
    }
}

extension ListPostVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
        
        cell.setPost(posts[indexPath.row])
        return cell
    }
}
