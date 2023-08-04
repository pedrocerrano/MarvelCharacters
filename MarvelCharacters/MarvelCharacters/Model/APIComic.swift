//
//  APIComic.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/22/23.
//

import Foundation

struct APIComicDictionary: Codable {
    private enum CodingKeys: String, CodingKey {
        case comicListData = "data"
    }
    
    let comicListData: APIComicsResults
}

struct APIComicsResults: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case offset
        case total
        case comicResults = "results"
    }
    
    let offset: Int
    let total: Int
    let comicResults: [APIComic]
}

struct APIComic: Codable, Hashable {
    let format: String
    let id: Int
    let title: String
    let description: String?
    let pageCount: Int
    let textObjects: [APIComicText]
    let thumbnail: APIComicThumbnail
}

struct APIComicText: Codable, Hashable {
    let text: String
}

struct APIComicThumbnail: Codable, Hashable {
    
    private enum CodingKeys: String, CodingKey {
        case imagePath      = "path"
        case imageExtention = "extension"
    }
    
    let imagePath: String
    let imageExtention: String
}
