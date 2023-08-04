//
//  MCImageView.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/22/23.
//

import UIKit

class MCImageView: UIImageView {

    //MARK: - Properties
    let cache       = APIService.shared.cache
    let placeholder = Images.placeholder
    
    
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
    
    func fetchCharacterImage(for character: MarvelCharacter) {
        Task {
            image = await APIService.shared.fetchCharacterImage(forCharacter: character) ?? placeholder
        }
    }
    
    func fetchComicImage(for comic: APIComic) {
        
    }
}
