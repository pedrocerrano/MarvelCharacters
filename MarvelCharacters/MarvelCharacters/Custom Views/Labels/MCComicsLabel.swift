//
//  MCComicsLabel.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/21/23.
//

import UIKit

class MCComicsLabel: UILabel {

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
        self.font = UIFont(name: "Marvel-Regular", size: fontSize)
    }

    
    //MARK: - Functions
    func configure() {
        textColor                 = .white
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
