//
//  TabBarController.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import Foundation
import UIKit
import AVFoundation
import MBProgressHUD

@available(iOS 13.0, *)
class TabBarController: UITabBarController,UITabBarControllerDelegate {
    
    var homeNavigationViewController : UINavigationController!
    var accountNavigationViewController : UINavigationController!
    
    var homeVC = HomeViewController()
    var accountVC = AccountViewController()
    
    var overlayView : UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overlayView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        overlayView.backgroundColor = UIColor.black
        overlayView.alpha = 0
        overlayView.isUserInteractionEnabled = false
        UITabBar.appearance().backgroundColor = .systemBackground

        //Post
        homeNavigationViewController = UINavigationController(rootViewController : homeVC)
        homeNavigationViewController.isNavigationBarHidden = true
        
        //Account
        accountNavigationViewController = UINavigationController(rootViewController : accountVC)
        accountNavigationViewController.isNavigationBarHidden = true
        
        viewControllers = [homeNavigationViewController, accountNavigationViewController]
        
        let attributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.font):UIFont.systemFont(ofSize: 10)]
        
        
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.tintColor = #colorLiteral(red: 0, green: 0.6470588235, blue: 0.6862745098, alpha: 1)
        
        tabBar.items?[0].image = UIImage(named: "ic_tab_posts")?.withRenderingMode(.alwaysTemplate)
        tabBar.items?[0].selectedImage = UIImage(named: "ic_tab_posts")?.withRenderingMode(.alwaysTemplate)
        tabBar.items?[0].title = "Post"
        tabBar.items?[0].titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
        tabBar.items?[0].setTitleTextAttributes(convertToOptionalNSAttributedStringKeyDictionary(attributes), for: .normal)

        tabBar.items?[1].image = UIImage(named: "ic_tab_account")?.withRenderingMode(.alwaysTemplate)
        tabBar.items?[1].selectedImage = UIImage(named: "ic_tab_account")?.withRenderingMode(.alwaysTemplate)
        tabBar.items?[1].title = "Account"
        tabBar.items?[1].titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
        tabBar.items?[1].setTitleTextAttributes(convertToOptionalNSAttributedStringKeyDictionary(attributes), for: .normal)
        
        self.tabBar.items?[0].imageInsets = UIEdgeInsets.init(top: -3, left: 0, bottom: 3, right: 0);
        self.tabBar.items?[1].imageInsets = UIEdgeInsets.init(top: -3, left: 0, bottom: 3, right: 0);
        
        homeNavigationViewController.tabBarItem =  tabBar.items?[0]
        accountNavigationViewController.tabBarItem = tabBar.items?[1]
        
        selectedViewController = homeNavigationViewController
        selectedIndex = 0
        
        self.tabBar.isTranslucent = false
        self.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tabBar.invalidateIntrinsicContentSize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTitle()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as! UIGestureRecognizerDelegate
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    func setTitle() {
        tabBar.items?[0].title = "Post"
        tabBar.items?[1].title = "Account"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
    return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
    guard let input = input else { return nil }
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
