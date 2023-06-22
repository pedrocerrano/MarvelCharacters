//
//  MarvelError.swift
//  MarvelCharacters
//
//  Created by iMac Pro on 6/22/23.
//

import Foundation

enum MarvelError: String, Error {
    
    case invalidURL         = "Invalid URL. Check your endpoint."
    case unableToComplete   = "Unable to complete your request. Please check your Internet connection."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server is invalid. Please try again."
    case unableToDecode     = "Unable to decode model object from data."
    case emptyArray         = "Unable to retrieve Character. Please try again."
}
