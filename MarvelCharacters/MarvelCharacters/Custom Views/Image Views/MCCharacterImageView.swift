//
//  MCCharacterImageView.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/22/23.
//

import UIKit

class MCCharacterImageView: UIImageView {

    //MARK: - Properties
    let cache       = APIService.shared.cache
    let placeholder = Images.marvelLogo
    
    
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
        clipsToBounds = true
        image         = placeholder
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func fetchCharacterImage(for character: Character) {
        Task {
            image = await APIService.shared.fetchCharacterImage(forCharacter: character) ?? placeholder
        }
    }
}
