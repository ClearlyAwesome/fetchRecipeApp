//
//  Recipe.swift
//  FetchRecipeApp
//
//  Created by R C on 12/16/24.
//

import Foundation

struct Recipe: Identifiable, Codable {
    let id: String
    let cuisine: String
    let name: String
    let photoUrlLarge: String?
    let photoUrlSmall: String?
    let sourceUrl: String?
    let youtubeUrl: String?
    
    var isFavorite: Bool = false // Default to false

    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case cuisine
        case name
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
        
    }

    // Custom decoding to debug optional fields
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        cuisine = try container.decode(String.self, forKey: .cuisine)
        name = try container.decode(String.self, forKey: .name)

        // Debug each field individually
        photoUrlLarge = try container.decodeIfPresent(String.self, forKey: .photoUrlLarge)
        photoUrlSmall = try container.decodeIfPresent(String.self, forKey: .photoUrlSmall)
        sourceUrl = try container.decodeIfPresent(String.self, forKey: .sourceUrl)
        youtubeUrl = try container.decodeIfPresent(String.self, forKey: .youtubeUrl)

        print("Decoded Recipe: \(name), Small Image: \(photoUrlSmall ?? "nil")")
    }
}
