//
//  CharacterView.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/22/23.
//

import SwiftUI

struct CharacterView: View {
    
    //MARK: - Properties
    var thumbnail: Thumbnail
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: thumbnail.imagePath + "." + thumbnail.imageExtention)) { image in
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

struct CharacterView_Previews: PreviewProvider {
    static let demoThumbnail = Thumbnail(imagePath: "http://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087", imageExtention: "jpg")
    
    static var previews: some View {
        let width                       = ScreenSize.width
        let minimumItemSpacing: CGFloat = 1
        let availableWidth              = width - (minimumItemSpacing * 3)
        let itemWidth                   = availableWidth / 4
        
        CharacterView(thumbnail: demoThumbnail)
            .frame(width: itemWidth)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
