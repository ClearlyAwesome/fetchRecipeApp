//
//  RecipeDetailView.swift
//  FetchRecipeApp
//
//  Created by R C on 12/16/24.
//

import SwiftUI

struct RecipeDetailView: View {
    @ObservedObject var viewModel: RecipeListViewModel
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Image Section
                if let imageUrl = recipe.photoUrlLarge, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding(10)

            // Cuisine with Flag
            HStack(alignment: .center, spacing: 5) {
                Text("Cuisine:")
                    .font(.title2)
                    .foregroundColor(.secondary)

                // Flag Image
                Image(FlagProvider.flagISO(for: recipe.cuisine))
                    .resizable()
                    .frame(width: 30, height: 20)
                    .clipShape(RoundedRectangle(cornerRadius: 3))

                // Cuisine Name
                Text(recipe.cuisine)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            Spacer(minLength: 20)
            // Buttons in HStack
            VStack(alignment: .center, spacing: 5) {
                if let sourceUrl = recipe.sourceUrl {
                    NavigationLink(destination: WebView(url: sourceUrl)) {
                        HStack {
                            Image(systemName: "globe")
                            Text("View Recipe")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                    }
                }

                Spacer()

                if let youtubeUrl = recipe.youtubeUrl, let url = URL(string: youtubeUrl) {
                    Button(action: {
                        openURL(url)
                    }) {
                        HStack {
                            Image(systemName: "play.rectangle")
                            Text("Watch on YouTube")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(8)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Recipe Details")
//        .navigationTitle(recipe.name)
        .toolbar {
            // Favorite Button in Toolbar
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    viewModel.toggleFavorite(for: recipe)
                }) {
                    Image(systemName: viewModel.isFavorite(recipe: recipe) ? "heart.fill" : "heart")
                        .foregroundColor(viewModel.isFavorite(recipe: recipe) ? .red : .gray)
                }
            }
        }
    }

    // Function to open URL
    private func openURL(_ url: URL) {
        UIApplication.shared.open(url)
    }
}
