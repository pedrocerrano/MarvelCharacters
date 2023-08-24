//
//  ComicView.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/26/23.
//

import SwiftUI

struct ComicView: View {
    
    //MARK: - Properties
    var comic: MarvelComic
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: comic.comicThumbnail)) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .clipped()
            } placeholder: {
                Image(uiImage: Images.marvelLogo!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct ComicView_Previews: PreviewProvider {
    
    static var previews: some View {
        let width                       = ScreenSize.width
        let minimumItemSpacing: CGFloat = 5
        let availableWidth              = width - (minimumItemSpacing * 2)
        let itemWidth                   = availableWidth / 3
        
        ComicView(comic: MarvelComic.sampleMarvelComic)
            .frame(width: itemWidth)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
