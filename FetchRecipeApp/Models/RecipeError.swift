//
//  RecipeError.swift
//  FetchRecipeApp
//
//  Created by R C on 12/16/24.
//

import Foundation

enum RecipeError: Error, LocalizedError {
    case invalidURL
    case networkError
    case decodingError

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL."
        case .networkError: return "Failed to fetch data from the server."
        case .decodingError: return "Failed to decode the response."
        }
    }
}
