//
//  NavigationTabBarViewController.swift
//  AkChat
//
//  Created by Amg on 14/10/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import UIKit

class NavigationTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }
}

extension NavigationTabBarViewController {
    //MARK: - SetUp TabBar
    private func setUpTabBar() {
        viewControllers = [setUpTabBarMessage(), setUpTabBarSearch(), setUpTabBarProfile()]
    }
}

extension NavigationTabBarViewController {
    //MARK: - Create All TabBar App
    private func setUpTabBarMessage() -> UIViewController {
        let messagesVC = MessagesViewController()
        messagesVC.title = "Messages"
        messagesVC.tabBarItem.image = UIImage(named: "messages")
        
        let navigationBar = UINavigationController(rootViewController: messagesVC)
        navigationBar.title = "Messages"
        
        return messagesVC
    }
    
    private func setUpTabBarSearch() -> UIViewController {
        let searchVC = SearchViewController()
        searchVC.title = "Search"
        searchVC.tabBarItem.image = UIImage(named: "recherche")
        
        let navigationBarSearch = UINavigationController(rootViewController: searchVC)
        navigationBarSearch.title = "Search"
        
        return searchVC
    }
    
    private func setUpTabBarProfile() -> UIViewController {
        let profileVC = ProfileViewController()
        profileVC.title = "Profile"
        profileVC.tabBarItem.image = UIImage(named: "profil")
        
        let navigationBarProfile = UINavigationController(rootViewController: profileVC)
        navigationBarProfile.title = "Profile"
        
        return profileVC
    }
}

