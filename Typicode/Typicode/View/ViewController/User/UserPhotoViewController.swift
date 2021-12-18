//
//  UserPhotoViewController.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 18/12/21.
//

import UIKit
import AlamofireImage

class UserPhotoViewController: ParentViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var photo = Photo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initLabel()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func initUI() {
        headerView.dropShadow()
        photoImageView.af.setImage(withURL: URL(string: photo.url)!)
        photoImageView.enableZoom()
    }
    
    func initLabel() {
        headerTitleLabel.text = TheStringManager.photo
        photoTitleLabel.text = photo.title.capitalized
    }
}

extension UIImageView {
  func enableZoom() {
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
    isUserInteractionEnabled = true
    addGestureRecognizer(pinchGesture)
  }

  @objc
  private func startZooming(_ sender: UIPinchGestureRecognizer) {
    let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
    guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
    sender.view?.transform = scale
    sender.scale = 1
  }
}
