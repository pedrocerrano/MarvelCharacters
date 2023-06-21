//
//  SearchViewController.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/21/23.
//

import UIKit

class ExploreViewController: UIViewController {

    //MARK: - Properties
    let logoImageView         = UIImageView()
    let comicsLabel           = MCComicsLabel(textAlignment: .center, fontSize: 40)
    let characterTextField    = MCTextField()
    let searchCharacterButton = MCButton(fontColor: .white, backgroundColor: .blue, title: "SEARCH")
    let exploreOnMyOwnButton  = MCButton(fontColor: .white, backgroundColor: .blue, title: "Explore on my own")
    
    var isCharacterEntered: Bool {
        return !characterTextField.text!.isEmpty
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.marvelRed
        configureLogo()
        configureTextField()
        configureSearchCharacterButton()
        configureExploreOnMyOwnButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        characterTextField.text = ""
    }

    
    //MARK: - Functions
    private func configureLogo() {
        view.addSubview(logoImageView)
        view.addSubview(comicsLabel)
        
        logoImageView.image = Images.marvelLogo
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        comicsLabel.text = LabelText.characters
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 2/5),
            
            comicsLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor),
            comicsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            comicsLabel.widthAnchor.constraint(equalTo: logoImageView.widthAnchor),
            comicsLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureTextField() {
        view.addSubview(characterTextField)
        characterTextField.delegate = self
        
        NSLayoutConstraint.activate([
            characterTextField.topAnchor.constraint(equalTo: comicsLabel.bottomAnchor, constant: 60),
            characterTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterTextField.widthAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 0.95),
            characterTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureSearchCharacterButton() {
        view.addSubview(searchCharacterButton)
        searchCharacterButton.addTarget(self, action: #selector(pushComicsListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            searchCharacterButton.topAnchor.constraint(equalTo: characterTextField.bottomAnchor, constant: 12),
            searchCharacterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchCharacterButton.widthAnchor.constraint(equalTo: characterTextField.widthAnchor),
            searchCharacterButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureExploreOnMyOwnButton() {
        view.addSubview(exploreOnMyOwnButton)
        exploreOnMyOwnButton.addTarget(self, action: #selector(pushCharacterListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            exploreOnMyOwnButton.topAnchor.constraint(equalTo: searchCharacterButton.bottomAnchor, constant: 60),
            exploreOnMyOwnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exploreOnMyOwnButton.widthAnchor.constraint(equalTo: characterTextField.widthAnchor),
            exploreOnMyOwnButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func pushComicsListVC() {
        guard isCharacterEntered else {
            #warning("Add alert")
            return
        }
        
        characterTextField.resignFirstResponder()
        let comicsListVC = ComicsListViewController()
        navigationController?.pushViewController(comicsListVC, animated: true)
    }
    
    @objc func pushCharacterListVC() {
        let characterListVC = CharacterListViewController()
        navigationController?.pushViewController(characterListVC, animated: true)
    }
        
    private func createDismissKeyboardTapGesture() {
        let tapAnywhere = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapAnywhere)
    }
} //: CLASS


//MARK: - TextField Delegate
extension ExploreViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushComicsListVC()
        return true
    }
}
