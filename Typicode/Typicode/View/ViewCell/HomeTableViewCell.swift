//
//  HomeTableViewCell.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent(post: Post) {
        bodyView.dropShadow()
        bodyView.addBorder(width: 0.2, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        bodyView.roundedCorner(cornerRadius: 8.0)
        titleLabel.text = post.title.capitalized
        bodyLabel.text = post.body.capitalized
        
        UserService().getUser(userId: post.userId) { success, users in
            self.usernameLabel.text = users.name
            self.companyLabel.text = "\(TheStringManager.company) : \(users.companyName)"
        } errorBlock: { errString in
            print(errString)
        }
    }
}
