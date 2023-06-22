//
//  Constants.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/21/23.
//

import UIKit

enum SFSymbols {
    static let explore     = UIImage(systemName: "magnifyingglass.circle.fill")
    static let favorites   = UIImage(systemName: "heart.circle.fill")
    static let placeholder = UIImage(systemName: "person")
}

enum LabelText {
    static let characters = "C H A R A C T E R S"
}

enum ScreenSize {
    static let width     = UIScreen.main.bounds.size.width
    static let height    = UIScreen.main.bounds.size.height
    static let maxLength = max(ScreenSize.width, ScreenSize.height)
    static let minLength = min(ScreenSize.width, ScreenSize.height)
}
