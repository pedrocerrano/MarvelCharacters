//
//  MCImageHeaderViewController.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/26/23.
//

import UIKit

class MCImageHeaderViewController: UIViewController {

    //MARK: - Properties
    let characterImageView   = MCImageView(frame: .zero)
    let backgroundView       = UIView()
    let characterNameLabel   = MCCharacterNameLabel(textAlignment: .left, fontSize: 25)
    let comicsAppearingLabel = MCCharacterSecondaryLabel(textAlignment: .left, textStyle: .body)
    
    var character: MarvelCharacter!
    
    
    //MARK: - Designated Initializer
    init(character: MarvelCharacter!) {
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
        view.addSubview(backgroundView)
        view.addSubview(characterNameLabel)
        view.addSubview(comicsAppearingLabel)
        
        characterImageView.fetchCharacterImage(for: character)
        backgroundView.backgroundColor = .systemBackground
        backgroundView.alpha           = 0.7
        characterNameLabel.text        = character.name
        comicsAppearingLabel.text      = "Appears in \(character.comicsAvailable) comics"
    }
    
    private func layoutUI() {
        let padding: CGFloat = 12
        characterImageView.contentMode = .scaleAspectFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: view.topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            characterImageView.heightAnchor.constraint(equalToConstant: Constraint.characterDetailImageHeight),
            
            backgroundView.bottomAnchor.constraint(equalTo: characterImageView.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: characterImageView.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 55),
            
            characterNameLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            characterNameLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: padding),
            characterNameLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -padding),
            characterNameLabel.heightAnchor.constraint(equalToConstant: 30),

            comicsAppearingLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor),
            comicsAppearingLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: padding),
            comicsAppearingLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -padding),
            comicsAppearingLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
} //: CLASS
