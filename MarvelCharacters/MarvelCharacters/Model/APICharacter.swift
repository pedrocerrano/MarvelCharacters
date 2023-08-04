//
//  APICharacter.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/22/23.
//

import Foundation

struct APICharacterDictionary: Codable {
    private enum CodingKeys: String, CodingKey {
        case listData = "data"
    }
    
    let listData: APIResults
}

struct APIResults: Codable {
    private enum CodingKeys: String, CodingKey {
//        case offset
        case listResults = "results"
    }
    
//    let offset: Int
    let listResults: [APICharacter]
}

struct APICharacter: Codable, Hashable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: APIThumbnail
    let resourceURI: String
    let comics: APIComics
}

struct APIThumbnail: Codable, Hashable {
    private enum CodingKeys: String, CodingKey {
        case imagePath      = "path"
        case imageExtention = "extension"
    }
    
    let imagePath: String
    let imageExtention: String
}

struct APIComics: Codable, Hashable {
    let available: Int
    let collectionURI: String
}
