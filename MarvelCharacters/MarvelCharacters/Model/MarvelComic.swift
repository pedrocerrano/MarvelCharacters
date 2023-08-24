//
//  MarvelComic.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 8/4/23.
//

import Foundation

struct MarvelComic: Identifiable, Hashable {
    let id: Int
    let title: String
    let description: String?
    let pageCount: Int
    let format: String
    let comicThumbnail: String
    let comicCharacters: Int
}


#if DEBUG
extension MarvelComic {
    
    static let sampleMarvelComic = MarvelComic(id: 0,
                                               title: "The Best Comic Ever",
                                               description: "Lots of superhero stuff happens",
                                               pageCount: 50,
                                               format: "Format Placeholder text",
                                               comicThumbnail: "http://i.annihil.us/u/prod/marvel/i/mg/d/03/58dd080719806.jpg",
                                               comicCharacters: 5)
}
#endif
