//
//  MCCharacterHeaderViewController.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/22/23.
//

import UIKit

class MCCharacterHeaderViewController: UIViewController {

    //MARK: - Properties
    let characterImageView   = MCCharacterImageView(frame: .zero)
    let characterNameLabel   = MCCharacterNameLabel(textAlignment: .left, fontSize: 25)
    let comicsAppearingLabel = MCCharacterSecondaryLabel(textAlignment: .left, textStyle: .body)
    
    var character: Character!
    
    
    //MARK: - Designated Initializer
    init(character: Character!) {
        super.init(nibName: nil, bundle: nil)
        self.character = character
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        layoutUI()
    }
    
    
    //MARK: - Functions
    private func configureUI() {
        view.addSubview(characterImageView)
        view.addSubview(characterNameLabel)
        view.addSubview(comicsAppearingLabel)
        
        characterImageView.fetchCharacterImage(for: character)
        characterNameLabel.text = character.name
        comicsAppearingLabel.text = "Appears in \(character.comics.available) comics"
    }
    
    private func layoutUI() {
        let padding: CGFloat         = 12
        let squareImageSize: CGFloat = 80
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            characterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: squareImageSize),
            characterImageView.heightAnchor.constraint(equalToConstant: squareImageSize),
            
            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: padding),
            characterNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            characterNameLabel.heightAnchor.constraint(equalToConstant: squareImageSize / 2),
            
            comicsAppearingLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor),
            comicsAppearingLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: padding),
            comicsAppearingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            comicsAppearingLabel.heightAnchor.constraint(equalToConstant: 25),
        ])
    }
} //: CLASS
