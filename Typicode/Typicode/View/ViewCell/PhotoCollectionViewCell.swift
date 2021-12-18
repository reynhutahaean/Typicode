//
//  PhotoCollectionViewCell.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 18/12/21.
//

import UIKit
import AlamofireImage

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setContent(photo: Photo) {
        let url = photo.thumbnailUrl
        photoImageView.af.setImage(withURL: URL(string: url)!)
        photoImageView.roundedCorner(cornerRadius: 8)
    }
}
