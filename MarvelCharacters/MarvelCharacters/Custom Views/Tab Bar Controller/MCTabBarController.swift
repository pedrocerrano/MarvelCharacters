//
//  MCTabBarController.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/21/23.
//

import UIKit

class MCTabBarController: UITabBarController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = Colors.marvelRed
        viewControllers                 = [createExploreNC(), createFavoritesNC()]
    }
    
    
    //MARK: - Functions
    func createExploreNC() -> UINavigationController {
        let exploreVC = ExploreViewController()
        exploreVC.tabBarItem = UITabBarItem(title: "Explore", image: SFSymbols.explore, tag: 0)
        
        return UINavigationController(rootViewController: exploreVC)
    }
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesVC = FavoritesViewController()
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: SFSymbols.favorites, tag: 0)
        
        return UINavigationController(rootViewController: favoritesVC)
    }
}
