//
//  AppDelegate.swift
//  BottomNavigationSwift
//
//  Created by Robert Wan on 22/3/2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window:UIWindow?
  
    let size = CGSize(width: 24, height: 24)
    
    let routes = [
        (HomeViewController(), "Home", "home"),
        (DocumentsViewController(), "Documents", "documents"),
        (SettingsViewController(), "Settings", "settings"),
    ] as [(UIViewController, String, String)]
    
    func getViewControllers() -> [UIViewController] {
        var viewControllers: [UIViewController] = []
        for i in 0..<routes.count {
            let (viewController, title, imageName) = routes[i]
            viewController.tabBarItem = UITabBarItem(title: title, image: resize(image: UIImage(named: imageName), size: size), tag: i)
            viewControllers.append(viewController)
        }
        return viewControllers
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = getViewControllers()
        tabBarController.tabBar.tintColor = .blue
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }
}
