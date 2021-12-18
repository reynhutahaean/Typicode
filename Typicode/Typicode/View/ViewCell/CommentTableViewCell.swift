//
//  CommentTableViewCell.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent(comment: Comment) {
        bodyView.dropShadow()
        bodyView.addBorder(width: 0.2, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        bodyView.roundedCorner(cornerRadius: 8.0)
        bodyLabel.text = comment.body.capitalized
        nameLabel.text = comment.name.capitalized
    }
}
