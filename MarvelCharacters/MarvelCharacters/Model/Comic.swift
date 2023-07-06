//
//  Comic.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/22/23.
//

import Foundation

struct ComicDictionary: Codable {
    private enum CodingKeys: String, CodingKey {
        case comicListData = "data"
    }
    
    let comicListData: ComicsResults
}

struct ComicsResults: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case offset
        case total
        case comicResults = "results"
    }
    
    let offset: Int
    let total: Int
    let comicResults: [Comic]
}

struct Comic: Codable, Hashable {
    let format: String
    let id: Int
    let title: String
    let description: String?
    let pageCount: Int
    let textObjects: [ComicText]
    let thumbnail: ComicThumbnail
}

struct ComicText: Codable, Hashable {
    let text: String
}

struct ComicThumbnail: Codable, Hashable {
    
    private enum CodingKeys: String, CodingKey {
        case imagePath      = "path"
        case imageExtention = "extension"
    }
    
    let imagePath: String
    let imageExtention: String
}
