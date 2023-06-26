//
//  CharacterDetailViewController.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/21/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    //MARK: - Properties
    enum Section { case main }
    
    let headerView        = UIView()
    let comicsContentView = UIView()
    
    var comicsCollectionView: UICollectionView!
    var comicsDataSource: UICollectionViewDiffableDataSource<Section, Comic>!

    var comics: [Comic] = []
    var pageOffset      = 0

    var character: Character!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        add(childViewController: MCImageHeaderViewController(character: character), to: headerView)
        configureViews()
        comicsContentView.backgroundColor = Colors.marvelRed
//        configureComicsCollectionView()
    }
    

    //MARK: - Functions
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = Colors.marvelRed
        title = character.name
    }
    
    private func add(childViewController: UIViewController, to containerView: UIView) {
        addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.frame = containerView.bounds
        childViewController.didMove(toParent: self)
    }
    
    private func configureViews() {
        view.addSubview(headerView)
        view.addSubview(comicsContentView)
        
        headerView.translatesAutoresizingMaskIntoConstraints        = false
        comicsContentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Constraint.characterDetailImageHeight),
            
            comicsContentView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            comicsContentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            comicsContentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            comicsContentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func configureComicsCollectionView() {
        comicsCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createComicFlowLayout(in: view))
        comicsContentView.addSubview(comicsCollectionView)
        comicsCollectionView.delegate        = self
        comicsCollectionView.backgroundColor = .systemBackground
        comicsCollectionView.register(ComicCollectionViewCell.self, forCellWithReuseIdentifier: ComicCollectionViewCell.reuseID)
    }
    
    private func updateData(on comics: [Comic]) {
        var shapshot = NSDiffableDataSourceSnapshot<Section, Comic>()
        shapshot.appendSections([.main])
        shapshot.appendItems(comics)
        DispatchQueue.main.async { self.comicsDataSource.apply(shapshot, animatingDifferences: true) }
    }
} //: CLASS


//MARK: - ComicCollectionViewDelegate
extension CharacterDetailViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
} //: CollectionViewDelegate
