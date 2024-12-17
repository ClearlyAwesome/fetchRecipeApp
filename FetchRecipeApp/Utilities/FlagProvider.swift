//
//  FlagProvider.swift
//  FetchRecipeApp
//
//  Created by R C on 12/16/24.
//

import Foundation

struct FlagProvider {
    static func flagISO(for cuisine: String) -> String {
        let isoMapping: [String: String] = [
            "British": "gb",
            "American": "us",
            "Canadian": "ca",
            "French": "fr",
            "Italian": "it",
            "Greek": "gr",
            "Portuguese": "pt",
            "Polish": "pl",
            "Russian": "ru",
            "Malaysian": "my",
            "Tunisian": "tn",
            "Croatian": "hr"
        ]
        // Default fallback image
        return isoMapping[cuisine] ?? "unknown"
    }
}
