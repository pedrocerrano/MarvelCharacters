//
//  CharacterCollectionViewCell.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/22/23.
//

import SwiftUI

class CharacterCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let reuseID     = "CharacterCell"
    var characterImageView = MCImageView(frame: .zero)
    
    
    //MARK: - Designated Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Functions
    func set(character: Character) {
        contentConfiguration = UIHostingConfiguration {
            CharacterView(thumbnail: character.thumbnail)
        }
        .margins(.all, 0)
    }
    
    private func configure() {
        contentView.addSubview(characterImageView)
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterImageView.heightAnchor.constraint(equalTo: characterImageView.widthAnchor)
        ])
    }
} //: CLASS
