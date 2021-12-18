//
//  UserViewController.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import UIKit

class UserViewController: ParentViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var streetTitleLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var suiteTitleLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var cityTitleLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipcodeTitleLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var companyTitleLabel: UILabel!
    @IBOutlet weak var companyNameTitleLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var catchPhraseTitleLabel: UILabel!
    @IBOutlet weak var catchPhraseLabel: UILabel!
    @IBOutlet weak var bsTitleLabel: UILabel!
    @IBOutlet weak var bsLabel: UILabel!
    @IBOutlet weak var albumTableView: UITableView!
    
    var users = User()
    var albumList = [Album]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getAlbum()
        initLabel()
        initTableView()
    }
    
    override func viewDidLayoutSubviews() {
        initUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func initUI() {
        bodyView.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, . bottomRight], radius: 10.0)
        backButton.setImageTintColor(.white)
        nameView.dropShadow()
        bodyView.dropShadow()
    }
    
    func initLabel() {
        nameLabel.text = users.name
        emailLabel.text = users.email
        streetTitleLabel.text = TheStringManager.street
        streetLabel.text = users.street
        suiteTitleLabel.text = TheStringManager.suite
        suiteLabel.text = users.suite
        cityTitleLabel.text = TheStringManager.city
        cityLabel.text = users.city
        zipcodeTitleLabel.text = TheStringManager.zipcode
        zipcodeLabel.text = users.zipcode
        companyTitleLabel.text = TheStringManager.company
        companyNameTitleLabel.text = TheStringManager.name
        companyNameLabel.text = users.companyName.replacingOccurrences(of: "-", with: " ").capitalized
        catchPhraseTitleLabel.text = TheStringManager.catchPhrase
        catchPhraseLabel.text = users.catchPhrase.replacingOccurrences(of: "-", with: " ").capitalized
        bsTitleLabel.text = TheStringManager.bs
        bsLabel.text = users.bs.replacingOccurrences(of: "-", with: " ").capitalized
    }
    
    func initTableView() {
        albumTableView.register(UINib(nibName: "AlbumTableViewCell", bundle: nil), forCellReuseIdentifier: "AlbumTableViewCell")
        albumTableView.delegate = self
        albumTableView.dataSource = self
    }
    
    func getAlbum() {
        self.showLoading(self.view)
        AlbumService().getAlbum(userId: self.users.id) { success, albums in
            self.hideLoading(self.view)
            self.albumList = albums
            self.albumTableView.reloadData()
        } errorBlock: { errString in
            print(errString)
        }
    }
}

extension UserViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = albumTableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell", for: indexPath) as! AlbumTableViewCell
        cell.setContent(album: albumList[indexPath.row])
        cell.albumId = albumList[indexPath.row].id
        
        return cell
    }
}
