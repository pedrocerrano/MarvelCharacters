//
//  CharacterDetailViewController.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/21/23.
//

import UIKit

class CharacterDetailViewController: MCDataLoadingViewController {

    //MARK: - Properties
    enum Section { case main }
    
    let headerView        = UIView()
    let comicsContentView = UIView()
    
    var comicsCollectionView: UICollectionView!
    var comicsDataSource: UICollectionViewDiffableDataSource<Section, APIComic>!

    var comics: [APIComic] = []
    var pageOffset      = 0

    var character: MarvelCharacter!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        add(childViewController: MCImageHeaderViewController(character: character), to: headerView)
        configureViews()
        configureComicsCollectionView()
        configureDataSource()
        fetchComics(offset: String(pageOffset))
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
    
    private func updateData(on comics: [APIComic]) {
        var shapshot = NSDiffableDataSourceSnapshot<Section, APIComic>()
        shapshot.appendSections([.main])
        shapshot.appendItems(comics)
        DispatchQueue.main.async { self.comicsDataSource.apply(shapshot, animatingDifferences: true) }
    }
    
    private func fetchComics(offset: String) {
        showLoadingView()
        
        Task {
            do {
                let comicDictionary = try await APIService.shared.fetchComicList(with: .comics(offset, character))
                let comics = comicDictionary.comicListData.comicResults.filter { comic in
                    !comic.thumbnail.imagePath.contains("image_not_available")
                }
                updateComicListUI(with: comics)
                dismissLoadingView()
            } catch {
                #warning("Create alert")
                dismissLoadingView()
            }
        }
    }
    
    private func updateComicListUI(with comics: [APIComic]) {
        self.comics.append(contentsOf: comics)
        updateData(on: comics)
    }
    
    private func configureDataSource() {
        comicsDataSource = UICollectionViewDiffableDataSource<Section, APIComic>(collectionView: comicsCollectionView, cellProvider: { collectionView, indexPath, comic in
            let cell = self.comicsCollectionView.dequeueReusableCell(withReuseIdentifier: ComicCollectionViewCell.reuseID, for: indexPath) as! ComicCollectionViewCell
            cell.set(comic: comic)
            return cell
        })
    }
} //: CLASS


//MARK: - ComicCollectionViewDelegate
extension CharacterDetailViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let comic = comics[indexPath.item]
        print("\(character.name) in: \"\(comic.title)\"")
    }
} //: CollectionViewDelegate
