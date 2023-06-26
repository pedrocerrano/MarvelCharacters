//
//  APIService.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/22/23.
//

import UIKit

class APIService {
    
    //MARK: - Properties
    static let shared = APIService()
    let decoder       = JSONDecoder()
    let cache         = NSCache<NSString, UIImage>()
    
    let baseURL   = "https://gateway.marvel.com/v1/public/characters"
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
    
    
    //MARK: - Functions
    func fetchCharacterList(paginationOffset offset: String) async throws -> CharacterDictionary {
        guard let baseURL = URL(string: baseURL) else { throw MarvelError.invalidURL }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let limitQuery     = URLQueryItem(name: limitKey, value: limitValue)
        let offsetQuery    = URLQueryItem(name: offsetKey, value: offset)
        let timeStampQuery = URLQueryItem(name: timeStampKey, value: timeStampValue)
        let apiQuery       = URLQueryItem(name: apiKeyKey, value: apiKeyValue)
        let hashQuery      = URLQueryItem(name: hashKey, value: hashValue)
        urlComponents?.queryItems = [limitQuery, offsetQuery, timeStampQuery, apiQuery, hashQuery]
        
        guard let finalURL = urlComponents?.url else { throw MarvelError.invalidURL }
        print("fetchCharacterList Final URL: \(finalURL)")
        
        let (data, response) = try await URLSession.shared.data(from: finalURL)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw MarvelError.invalidResponse
        }
            
        do {
            return try decoder.decode(CharacterDictionary.self, from: data)
        } catch {
            throw MarvelError.invalidData
        }
    }
    
    func fetchCharacterImage(forCharacter character: Character) async -> UIImage? {
        let imageURLString = "\(character.thumbnail.imagePath).\(character.thumbnail.imageExtention)"
        let cacheKey = NSString(string: imageURLString)
        if let image = cache.object(forKey: cacheKey) {
            return image
        }
        
        guard let finalURL = URL(string: imageURLString) else { return nil }
        print("fetchAvengerImage Final URL: \(finalURL)")
        
        do {
            let (data, _) = try await URLSession.shared.data(from: finalURL)
            guard let image = UIImage(data: data) else { return nil }
            cache.setObject(image, forKey: cacheKey)
            
            return image
        } catch {
            return nil
        }
    }
    
    func fetchComicList() {
        
    }
    
    func fetchComicImage() {
        
    }
} //: CLASS
