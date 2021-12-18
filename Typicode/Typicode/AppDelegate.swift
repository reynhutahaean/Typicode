//
//  AppDelegate.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import UIKit

@available(iOS 13.0, *)
let TheAppController = UIApplication.shared.delegate as! AppDelegate

@available(iOS 13.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainNavigationController: UINavigationController?
    var globalTabBarController: TabBarController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
                
        handleFirstScreen()
                
        return true
    }
    
    func handleFirstScreen() {
        
        let vc = HomeViewController()
        let navigationController = UINavigationController(rootViewController: vc)

        navigationController.isNavigationBarHidden = true
        navigationController.navigationBar.shadowImage = nil
        navigationController.navigationBar.isTranslucent = true

        mainNavigationController = navigationController

        self.window?.rootViewController = mainNavigationController
        self.window?.backgroundColor = UIColor.init(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
        
        tabBarController()
    }
    
    func tabBarController(){
        globalTabBarController = TabBarController()
        globalTabBarController.selectedIndex = 0
        mainNavigationController?.pushViewController(globalTabBarController, animated: true)
    }
}

