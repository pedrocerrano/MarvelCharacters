//
//  MarvelEndpoints.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 7/11/23.
//

import Foundation

enum MarvelEndpoints {
    static let baseURL = URL(string: "https://gateway.marvel.com/v1/public/characters")
    
    case characters(String)
    case comics(String, Character)
    
    var fullURL: URL? {
        let comicPath = "/comics"
        
        let limitKey   = "limit"
        let limitValue = "100"
        let offsetKey  = "offset"
        
        let timeStampKey   = "ts"
        let timeStampValue = "1"
        let apiKeyKey      = "apikey"
        let apiKeyValue    = "68470b7b93879cefb8d99a7c5a5b6c0f"
        let hashKey        = "hash"
        let hashValue      = "2823b9ddec02040bbdd3b5a6ae2c70f9"
        
        guard let url = Self.baseURL,
              var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        
        switch self {
        case .characters(let pageOffset):
            let limitQuery     = URLQueryItem(name: limitKey, value: limitValue)
            let offsetQuery    = URLQueryItem(name: offsetKey, value: pageOffset)
            let timeStampQuery = URLQueryItem(name: timeStampKey, value: timeStampValue)
            let apiQuery       = URLQueryItem(name: apiKeyKey, value: apiKeyValue)
            let hashQuery      = URLQueryItem(name: hashKey, value: hashValue)
            urlComponents.queryItems = [limitQuery, offsetQuery, timeStampQuery, apiQuery, hashQuery]
        case .comics(let pageOffset, let character):
            urlComponents.path.append(contentsOf: "/\(character.id)")
            urlComponents.path.append(contentsOf: comicPath)
            
            let limitQuery      = URLQueryItem(name: limitKey, value: limitValue)
            let offsetQuery     = URLQueryItem(name: offsetKey, value: pageOffset)
            let timeStampQuery  = URLQueryItem(name: timeStampKey, value: timeStampValue)
            let apiQuery        = URLQueryItem(name: apiKeyKey, value: apiKeyValue)
            let hashQuery       = URLQueryItem(name: hashKey, value: hashValue)
            urlComponents.queryItems = [limitQuery, offsetQuery, timeStampQuery, apiQuery, hashQuery]
        }
        
        return urlComponents.url
    }
}
