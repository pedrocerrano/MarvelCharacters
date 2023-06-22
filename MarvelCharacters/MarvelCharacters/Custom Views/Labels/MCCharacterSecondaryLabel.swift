//
//  MCCharacterSecondaryLabel.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/22/23.
//

import UIKit

class MCCharacterSecondaryLabel: UILabel {

    //MARK: - Designated Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Convenience Initializer
    convenience init(textAlignment: NSTextAlignment, textStyle: UIFont.TextStyle) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font          = UIFont.preferredFont(forTextStyle: textStyle)
    }
    
    
    //MARK: - Functions
    private func configure() {
        textColor                 = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor        = 0.9
        lineBreakMode             = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
} //: CLASS
