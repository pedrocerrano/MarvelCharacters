//
//  CharacterView.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/22/23.
//

import SwiftUI

struct CharacterView: View {
    
    //MARK: - Properties
    var character: MarvelCharacter
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: character.thumbnail)) { image in
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
    
    static var previews: some View {
        let width                       = ScreenSize.width
        let minimumItemSpacing: CGFloat = 1
        let availableWidth              = width - (minimumItemSpacing * 3)
        let itemWidth                   = availableWidth / 4
        
        CharacterView(character: MarvelCharacter.sampleMarvelCharacter)
            .frame(width: itemWidth)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
