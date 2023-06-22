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
    
    var characters: [Character]         = []
    var filteredCharacters: [Character] = []
    var pageOffset                      = 0
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Character>!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureSearchController()
        configureCollectionView()
        configureDataSource()
        fetchCharacters(pageOffset: String(pageOffset))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    

    //MARK: - Functions
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Character List"
    }
    
    private func configureSearchController() {
        let searchController                                  = UISearchController()
        searchController.searchResultsUpdater                 = self
        searchController.searchBar.placeholder                = "Search for a Character"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController                       = searchController
        navigationItem.hidesSearchBarWhenScrolling            = false
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createCharacterFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate        = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.reuseID)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Character>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, character) in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.reuseID, for: indexPath) as! CharacterCollectionViewCell
            cell.set(character: character)
            return cell
        })
    }
    
    private func updateData(on characters: [Character]) {
        var shapshot = NSDiffableDataSourceSnapshot<Section, Character>()
        shapshot.appendSections([.main])
        shapshot.appendItems(characters)
        DispatchQueue.main.async { self.dataSource.apply(shapshot, animatingDifferences: true) }
    }
    
    private func fetchCharacters(pageOffset: String) {
        showLoadingView()
        
        Task {
            do {
                let characterDictionary = try await APIService.shared.fetchCharacterList(paginationOffset: pageOffset)
                let characters          = characterDictionary.listData.listResults.filter ({ character in
                    !character.thumbnail.imagePath.contains("image_not_available")
                    && !character.thumbnail.imageExtention.contains("gif")
                    && character.comics.available != 0
                })
                updateUI(with: characters)
                dismissLoadingView()
            } catch {
                #warning("Show alert if this fails")
                dismissLoadingView()
            }
        }
    }
    
    private func updateUI(with characters: [Character]) {
        self.characters.append(contentsOf: characters)
        self.updateData(on: self.characters)
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
        let destinationVC       = ComicsListViewController()
        destinationVC.character = character
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}


//MARK: - SearchResultsUpdating
extension CharacterListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            filteredCharacters.removeAll()
            updateData(on: characters)
            return
        }
        
        filteredCharacters = characters.filter { $0.name.lowercased().contains(filter.lowercased()) }
        updateData(on: filteredCharacters)
    }
}
