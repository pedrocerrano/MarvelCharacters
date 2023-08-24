//
//  MarvelCharacter.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 8/4/23.
//

import Foundation

struct MarvelCharacter: Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: String
    let resourseURI: String
    let comicsAvailable: Int
    let comicsColletionURI: String
}


#if DEBUG
extension MarvelCharacter {
    
    static let sampleMarvelCharacter = MarvelCharacter(id: 0,
                                                       name: "Captain America",
                                                       description: "The best Marvel superhero!",
                                                       thumbnail: "http://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087.jpg",
                                                       resourseURI: "Resource URL placeholder",
                                                       comicsAvailable: 1000,
                                                       comicsColletionURI: "Comics Collection URI placeholder")
}
#endif

