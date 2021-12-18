//
//  DetailViewController.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import UIKit

class DetailViewController: ParentViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentTabelView: UITableView!
    
    var titles = ""
    var body = ""
    var postId = 0
    var userId = 0
    var commentList = [Comment]()
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initLabel()
        initTableView()
        getComment()
        getUser()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func initUI() {
        headerView.dropShadow()
    }
    
    func initLabel() {
        headerTitleLabel.text = TheStringManager.detail.capitalized
        titleLabel.text = titles.capitalized
        bodyLabel.text = body.capitalized
    }
    
    func initTableView() {
        commentTabelView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
        commentTabelView.dataSource = self
        commentTabelView.delegate = self
    }
    
    func getComment() {
        self.showLoading(self.view)
        CommentService().getComment(postId: self.postId) { success, comments in
            self.hideLoading(self.view)
            self.commentList = comments
            self.commentTabelView.reloadData()
        } errorBlock: { errString in
            print(errString)
        }
    }
    
    func getUser() {
        UserService().getUser(userId: self.userId) { success, users in
            self.user = users
            self.usernameLabel.text = "by : \(users.name)"
        } errorBlock: { errString in
            print(errString)
        }

    }
    
    @IBAction func usernameButtonTapped(_ sender: Any) {
        let vc = UserViewController()
        vc.users = self.user
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentTabelView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
        cell.setContent(comment: commentList[indexPath.row])
        
        return cell
    }
}
