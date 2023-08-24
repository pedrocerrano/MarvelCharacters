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
    
    
    //MARK: - Functions
    func fetchCharacterList(with endpoint: MarvelEndpoints) async throws -> [MarvelCharacter] {
        guard let finalURL = endpoint.fullURL else { throw MarvelError.invalidURL }
        print("fetchCharacterList Final URL: \(finalURL)")
        
        let (data, response) = try await URLSession.shared.data(from: finalURL)
        if let response = response as? HTTPURLResponse {
            print("Fetch Character Response Status Code: \(response.statusCode)")
        }
            
        do {
            let apiCharacterDictionary = try decoder.decode(APICharacterDictionary.self, from: data)
            return APIServiceModelHelper.createMarvelCharacter(apiCharacterDictionary.listData.listResults)
        } catch {
            throw MarvelError.invalidData
        }
    }
    
    func fetchCharacterImage(forCharacter character: MarvelCharacter) async -> UIImage? {
        let imageURLString = character.thumbnail
        let cacheKey = NSString(string: imageURLString)
        if let image = cache.object(forKey: cacheKey) {
            return image
        }
        
        guard let finalURL = URL(string: imageURLString) else { return nil }
        print("fetchCharacterImage Final URL: \(finalURL)")
        
        do {
            let (data, _) = try await URLSession.shared.data(from: finalURL)
            guard let image = UIImage(data: data) else { return nil }
            cache.setObject(image, forKey: cacheKey)
            
            return image
        } catch {
            return nil
        }
    }
    
    func fetchComicList(with endpoint: MarvelEndpoints) async throws -> [MarvelComic] {
        guard let finalURL = endpoint.fullURL else { throw MarvelError.invalidURL }
        print("fetchComicList Final URL: \(finalURL)")
        
        let (data, response) = try await URLSession.shared.data(from: finalURL)
        if let response = response as? HTTPURLResponse {
            print("Fetch Comic List Response Status Code: \(response.statusCode)")
        }
        
        do {
            let comicDictionary = try decoder.decode(APIComicDictionary.self, from: data)
            return APIServiceModelHelper.createMarvelComic(comicDictionary.comicListData.comicResults)
        } catch {
            throw MarvelError.invalidData
        }
    }
    
    func fetchComicImage(forComic comic: MarvelComic) async -> UIImage? {
        let imageURLString = comic.comicThumbnail
        let cacheKey = NSString(string: imageURLString)
        if let image = cache.object(forKey: cacheKey) {
            return image
        }
        
        guard let finalURL = URL(string: imageURLString) else { return nil }
        print("fetchComicImage Final URL: \(finalURL)")
        
        do {
            let (data, _) = try await URLSession.shared.data(from: finalURL)
            guard let image = UIImage(data: data) else { return nil }
            cache.setObject(image, forKey: cacheKey)
            return image
        } catch {
            return nil
        }
    }
} //: CLASS
