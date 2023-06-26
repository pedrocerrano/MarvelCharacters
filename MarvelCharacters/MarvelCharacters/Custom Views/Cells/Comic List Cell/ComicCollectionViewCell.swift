//
//  ComicCollectionViewCell.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/26/23.
//

import SwiftUI

class ComicCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let reuseID = "ComicCell"
    var comicImageView = MCImageView(frame: .zero)
    
    
    //MARK: - Designated Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Functions
    func set(comic: Comic) {
        contentConfiguration = UIHostingConfiguration {
            ComicView(comicThumbnail: comic.thumbnail)
        }
        .margins(.all, 0)
    }
    
    private func configure() {
        contentView.addSubview(comicImageView)
        
        NSLayoutConstraint.activate([
            comicImageView.topAnchor.constraint(equalTo: topAnchor),
            comicImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            comicImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            comicImageView.heightAnchor.constraint(equalTo: comicImageView.widthAnchor * 1.5)
        ])
    }
}
