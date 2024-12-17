//
//  ContentView.swift
//  FetchRecipeApp
//
//  Created by R C on 12/16/24.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecipeListViewModel()
    @State private var searchText = ""
    @State private var isFilterPresented = false


    var body: some View {
//        NavigationView {
            List(filteredRecipes) { recipe in
                NavigationLink(destination: RecipeDetailView(viewModel: viewModel, recipe: recipe)) {
                    RecipeRowView(recipe: recipe, viewModel: viewModel)
                }
            }
            .searchable(text: $searchText, prompt: "Search recipes or country")
            .refreshable {
                await viewModel.fetchRecipes()
            }
            .navigationTitle("Recipes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { isFilterPresented.toggle() }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                }
            }
            .task {
                await viewModel.fetchRecipes()
            }
            .sheet(isPresented: $isFilterPresented) {
                FilterView(
                    selectedCountries: $viewModel.selectedCountries, // Updated to handle a Set
                    showFavorites: $viewModel.showFavorites,
                    viewModel: viewModel
                )
                .presentationDetents([.fraction(0.4), .large])
            }

//        }
    }

    private var filteredRecipes: [Recipe] {
        viewModel.sortedRecipes.filter { recipe in
            searchText.isEmpty || recipe.name.localizedCaseInsensitiveContains(searchText) ||
            recipe.cuisine.localizedCaseInsensitiveContains(searchText)
        }
    }
}

#Preview {
    RecipeListView()
}
