//
//  MCTextField.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/21/23.
//

import UIKit

class MCTextField: UITextField {

    //MARK: - Designated Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK: - Functions
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth  = 2
        layer.borderColor  = UIColor.white.cgColor
        
        textColor       = .label
        tintColor       = .label
        textAlignment   = .center
        font            = UIFont.preferredFont(forTextStyle: .title3)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor    = .tertiarySystemBackground
        autocorrectionType = .no
        returnKeyType      = .search
        clearButtonMode    = .whileEditing
        placeholder        = "Search Marvel Characters"
    }
}
