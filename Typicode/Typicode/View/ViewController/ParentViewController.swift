//
//  ParentViewController.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import Foundation
import UIKit
import MBProgressHUD

class ParentViewController: UIViewController {
    var isShowingAlert = false
    var isShowingMsg = false
    var hud:MBProgressHUD = MBProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    init(){
        super.init(nibName:nil,bundle:nil)
    }
    
    init(nibName:String){
        super.init(nibName:nibName,bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showLoading(_ view:UIView){
        hideLoading(view)
        hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = ""
    }
    func showLoadingAsync(_ view:UIView){
        showLoading(view)
        hud.isUserInteractionEnabled = false
    }
    
    func hideLoading(_ view:UIView){
        MBProgressHUD.hide(for: view, animated: true)
    }
}
