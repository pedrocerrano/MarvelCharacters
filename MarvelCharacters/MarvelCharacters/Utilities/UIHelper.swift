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
        
        let flowLayout                  = UICollectionViewFlowLayout()
//        flowLayout.sectionInset         = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumLineSpacing   = 1
        flowLayout.minimumInteritemSpacing = 1
        flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth)
        
        return flowLayout
    }
}
