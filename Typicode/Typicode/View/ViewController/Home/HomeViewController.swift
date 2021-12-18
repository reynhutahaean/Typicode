//
//  HomeViewController.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import UIKit

class HomeViewController: ParentViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var postsList = [Post]()
    var user = User()
    var userId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initTableView()
        getPosts()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func initUI() {
        headerView.dropShadow()
    }
    
    func initTableView() {
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    func getPosts() {
        self.showLoading(self.view)
        PostService().getPost { success, posts in
            self.hideLoading(self.view)
            self.postsList = posts
            for i in 0..<self.postsList.count {
                self.userId = self.postsList[i].userId
                UserService().getUser(userId: self.userId) { scs, users in
                    self.user = users
                } errorBlock: { errString in
                    print(errString)
                }
            }
            self.tableView.reloadData()
        } errorBlock: { errString in
            print(errString)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.setContent(post: postsList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let vc = DetailViewController()
        vc.userId = postsList[indexPath.row].userId
        vc.postId = postsList[indexPath.row].id
        vc.titles = postsList[indexPath.row].title
        vc.body = postsList[indexPath.row].body
        tableView.deselectRow(at: indexPath, animated: true)
        TheAppController.mainNavigationController?.pushViewController(vc, animated: true)
    }
}
