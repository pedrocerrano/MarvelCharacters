//
//  Character.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/22/23.
//

import Foundation

struct CharacterDictionary: Codable {
    private enum CodingKeys: String, CodingKey {
        case listData = "data"
    }
    
    let listData: Results
}

struct Results: Codable {
    private enum CodingKeys: String, CodingKey {
        case offset
        case listResults = "results"
    }
    
    let offset: Int
    let listResults: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics: Comics
}

struct Thumbnail: Codable {
    private enum CodingKeys: String, CodingKey {
        case imagePath      = "path"
        case imageExtention = "extension"
    }
    
    let imagePath: String
    let imageExtention: String
}

struct Comics: Codable {
    let available: Int
    let collectionURI: String
}
