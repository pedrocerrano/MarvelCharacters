//
//  UIHelper.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/22/23.
//

import UIKit

enum UIHelper {
    
    static func createCharacterFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                       = view.bounds.width
        let minimumItemSpacing: CGFloat = 1
        let availableWidth              = width - (minimumItemSpacing * 3)
        let itemWidth                   = availableWidth / 4
        
        let flowLayout                     = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing      = 1
        flowLayout.minimumInteritemSpacing = 1
        flowLayout.itemSize                = CGSize(width: itemWidth, height: itemWidth)
        
        return flowLayout
    }
    
    static func createComicFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                       = view.bounds.width
        let minimumItemSpacing: CGFloat = 5
        let availableWidth              = width - (minimumItemSpacing * 2)
        let itemWidth                   = availableWidth / 3
        
        let flowLayout                     = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing      = 1
        flowLayout.minimumInteritemSpacing = 1
        flowLayout.itemSize                = CGSize(width: itemWidth, height: itemWidth * 1.5)
        
        return flowLayout
    }
}
