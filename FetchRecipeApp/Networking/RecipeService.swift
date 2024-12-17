//
//  RecipeService.swift
//  FetchRecipeApp
//
//  Created by R C on 12/16/24.
//

import Foundation

class RecipeService {
    private let apiURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"

    func fetchRecipes() async throws -> [Recipe] {
        guard let url = URL(string: apiURL) else {
            throw RecipeError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        // Debug raw JSON response
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Raw JSON Response: \(jsonString)")
        } else {
            print("Failed to decode raw JSON as a string")
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys

        do {
            let decodedResponse = try decoder.decode(RecipeResponse.self, from: data)
            return decodedResponse.recipes
        } catch {
            print("Decoding Error: \(error)")
            throw RecipeError.decodingError
        }
    }
}

struct RecipeResponse: Codable {
    let recipes: [Recipe]
}
