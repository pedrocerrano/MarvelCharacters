//
//  MCCharacterNameLabel.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/22/23.
//

import UIKit

class MCCharacterNameLabel: UILabel {

    //MARK: - Designated Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Convenience Initializer
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font          = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
    
    
    //MARK: - Functions
    private func configure() {
        textColor                 = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor        = 0.7
        numberOfLines             = 3
//        lineBreakMode             = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
} //: CLASS
