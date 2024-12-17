//
//  RecipeListViewModel.swift
//  FetchRecipeApp
//
//  Created by R C on 12/16/24.

import Foundation

class RecipeListViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var selectedCountries: Set<String> = [] // Multi-selection
    @Published var showFavorites: Bool = false  // Toggle for favorites
    @Published var sortOrder: SortOrder = .ascending // Sort order
    @Published private var favoriteRecipeIDs: Set<String> = [] // Track favorite IDs
    @Published var errorMessage: String? = nil

    enum SortOrder: String, CaseIterable {
        case ascending = "A-Z"
        case descending = "Z-A"
    }

    // Filtered and Sorted Recipes
    var sortedRecipes: [Recipe] {
        let filtered = recipes.filter { recipe in
            // Country filter: Include if selectedCountries is empty or recipe.cuisine matches any selected
            let matchesCountry = selectedCountries.isEmpty || selectedCountries.contains(recipe.cuisine)
            
            // Favorites filter: Include if showFavorites is false or recipe is a favorite
            let matchesFavorites = !showFavorites || isFavorite(recipe: recipe)
            
            return matchesCountry && matchesFavorites
        }
        
        // Sort the filtered recipes
        return filtered.sorted {
            sortOrder == .ascending ? $0.name < $1.name : $0.name > $1.name
        }
    }

    // Check if a recipe is a favorite
    func isFavorite(recipe: Recipe) -> Bool {
        favoriteRecipeIDs.contains(recipe.id)
    }

    // Toggle favorite status for a recipe
    func toggleFavorite(for recipe: Recipe) {
        if favoriteRecipeIDs.contains(recipe.id) {
            favoriteRecipeIDs.remove(recipe.id)
        } else {
            favoriteRecipeIDs.insert(recipe.id)
        }
        objectWillChange.send() // Manually notify views of the change
    }

    func fetchRecipes() async {
        do {
            let fetchedRecipes = try await RecipeService().fetchRecipes()
            DispatchQueue.main.async {
                self.recipes = fetchedRecipes
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Failed to fetch recipes."
            }
            print("Error fetching recipes: \(error)")
        }
    }

    // Extract Unique Countries
    var uniqueCountries: [String] {
        Array(Set(recipes.map { $0.cuisine })).sorted()
    }
}
