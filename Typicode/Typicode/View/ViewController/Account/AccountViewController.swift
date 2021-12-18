//
//  AccountViewController.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidLayoutSubviews() {
        headerView.dropShadow()
        headerView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20.0)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
