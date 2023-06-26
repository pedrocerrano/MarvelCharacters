//
//  ComicView.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/26/23.
//

import SwiftUI

struct ComicView: View {
    
    //MARK: - Properties
    var comicThumbnail: ComicThumbnail
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: comicThumbnail.imagePath + "." + comicThumbnail.imageExtention)) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
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
    static let comicDemoThumbnail = ComicThumbnail(imagePath: "http://i.annihil.us/u/prod/marvel/i/mg/d/03/58dd080719806", imageExtention: "jpg")
    
    static var previews: some View {
        let width                       = ScreenSize.width
        let minimumItemSpacing: CGFloat = 5
        let availableWidth              = width - (minimumItemSpacing * 2)
        let itemWidth                   = availableWidth / 3
        
        ComicView(comicThumbnail: comicDemoThumbnail)
            .frame(width: itemWidth)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
