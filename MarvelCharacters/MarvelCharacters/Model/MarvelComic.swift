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
    let comicText: String
}
