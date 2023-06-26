//
//  CharacterDetailViewController.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/21/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    //MARK: - Properties
    let headerView          = UIView()
    var itemViews: [UIView] = []
    
    var character: Character!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        add(childViewController: MCCharacterHeaderViewController(character: character), to: headerView)
        layoutUI()
    }
    

    //MARK: - Functions
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(false, animated: true)
        title = character.name
    }
    
//    private func configureUI(with character: Character) {
//        self.add(childViewController: MCCharacterHeaderViewController(character: character), to: headerView)
//    }
    
    private func add(childViewController: UIViewController, to containerView: UIView) {
        addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.frame = containerView.bounds
        childViewController.didMove(toParent: self)
    }
    
    private func layoutUI() {
        let padding: CGFloat = 12
        itemViews = [headerView]
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            ])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
} //: CLASS
