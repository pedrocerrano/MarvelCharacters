//
//  CharacterListViewController.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/21/23.
//

import UIKit

class CharacterListViewController: MCDataLoadingViewController {

    //MARK: - Properties
    enum Section { case main }
    
    let logoImageView   = UIImageView()
    let charactersLabel = MCComicsTitlePageLabel(textAlignment: .center, fontSize: 40)
    let contentView     = UIView()
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, MarvelCharacter>!

    var characters: [MarvelCharacter] = []
    var pageOffset = 0
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureViews()
        configureCollectionView()
        configureDataSource()
        fetchCharacters(pageOffset: String(pageOffset))
    }
    
    
    //MARK: - Functions
    private func configureViewController() {
        view.backgroundColor = Colors.marvelRed
    }
    
    private func configureViews() {
        view.addSubview(logoImageView)
        view.addSubview(charactersLabel)
        view.addSubview(contentView)
        
        logoImageView.image  = Images.marvelLogo
        charactersLabel.text = LabelText.characters
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints  = false
        contentView.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 2/5),
            
            charactersLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor),
            charactersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            charactersLabel.widthAnchor.constraint(equalTo: logoImageView.widthAnchor),
            charactersLabel.heightAnchor.constraint(equalToConstant: 40),
            
            contentView.topAnchor.constraint(equalTo: charactersLabel.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createCharacterFlowLayout(in: view))
        contentView.addSubview(collectionView)
        collectionView.delegate        = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.reuseID)
    }
    
    private func updateData(on characters: [MarvelCharacter]) {
        var shapshot = NSDiffableDataSourceSnapshot<Section, MarvelCharacter>()
        shapshot.appendSections([.main])
        shapshot.appendItems(characters)
        DispatchQueue.main.async { self.dataSource.apply(shapshot, animatingDifferences: true) }
    }
    
    private func fetchCharacters(pageOffset: String) {
        showLoadingView()
        
        Task {
            do {
                let marvelCharacters = try await APIService.shared.fetchCharacterList(with: .characters(pageOffset))
                let characters       = marvelCharacters.filter { character in
                    !character.thumbnail.contains("image_not_available")
                    && !character.thumbnail.contains("gif")
                    && character.comicsAvailable != 0
                }
                updateUI(with: characters)
                dismissLoadingView()
            } catch {
                #warning("Show alert if this fails")
                dismissLoadingView()
            }
        }
    }
    
    private func updateUI(with characters: [MarvelCharacter]) {
        self.characters.append(contentsOf: characters)
        self.updateData(on: self.characters)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, MarvelCharacter>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, character) in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.reuseID, for: indexPath) as! CharacterCollectionViewCell
            cell.set(character: character)
            return cell
        })
    }
} //: CLASS


//MARK: - CollectionViewDelegate
extension CharacterListViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY       = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height        = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            pageOffset += 100
            fetchCharacters(pageOffset: String(pageOffset))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character           = characters[indexPath.item]
        print("\(character.name)")
        
        let destinationVC       = CharacterDetailViewController()
        destinationVC.character = character
        navigationController?.pushViewController(destinationVC, animated: true)
    }
} //: CollectionViewDelegate
