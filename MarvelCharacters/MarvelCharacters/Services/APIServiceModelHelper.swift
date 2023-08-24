//
//  APIServiceModelHelper.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 8/4/23.
//

import Foundation

struct APIServiceModelHelper {
    
    static func createMarvelCharacter(_ apiCharacters: [APICharacter]) -> [MarvelCharacter] {
        
        var marvelCharacters: [MarvelCharacter] = []
        
        for (_, character) in apiCharacters.enumerated() {
            let marvelCharacter = MarvelCharacter(id: character.id,
                                                  name: character.name,
                                                  description: character.description,
                                                  thumbnail: "\(character.thumbnail.imagePath).\(character.thumbnail.imageExtention)",
                                                  resourseURI: character.resourceURI,
                                                  comicsAvailable: character.comics.available,
                                                  comicsColletionURI: character.comics.collectionURI)
            marvelCharacters.append(marvelCharacter)
        }
        
        return marvelCharacters
    }
    
    static func createMarvelComic(_ apiComics: [APIComic]) -> [MarvelComic] {
        var marvelComics: [MarvelComic] = []
        for (_, comic) in apiComics.enumerated() {
            let marvelComic = MarvelComic(id: comic.id,
                                          title: comic.title,
                                          description: comic.description,
                                          pageCount: comic.pageCount,
                                          format: comic.format,
                                          comicThumbnail: "\(comic.thumbnail.imagePath).\(comic.thumbnail.imageExtention)",
                                          comicCharacters: comic.characters.available)
            marvelComics.append(marvelComic)
        }
        
        return marvelComics
    }
}
