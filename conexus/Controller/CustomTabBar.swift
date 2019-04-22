//
//  CustomTabBar.swift
//  CRE8
//
//  Created by Lahari Ganti on 4/19/19.
//  Copyright © 2019 Lahari Ganti. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        tabBar.tintColor = .greenVogue

        let feedNC = UINavigationController(rootViewController: FeedVC())
        feedNC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_color"))

        let libraryNC = UINavigationController(rootViewController: LibraryVC())
        libraryNC.tabBarItem = UITabBarItem(title: "Library", image: UIImage(named: "library"), selectedImage: UIImage(named: "library_color"))

        let trendingNC = UINavigationController(rootViewController: TrendingVC())
        trendingNC.tabBarItem = UITabBarItem(title: "Trending", image: UIImage(named: "trending"), selectedImage: UIImage(named: "trending_color"))


        viewControllers = [feedNC, trendingNC, libraryNC]
    }
}
