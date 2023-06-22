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
        let minimumItemSpacing: CGFloat = 10
        let availableWidth              = width - (minimumItemSpacing * 3)
        let itemWidth                   = availableWidth / 4
        
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth)
        
        return flowLayout
    }
}
