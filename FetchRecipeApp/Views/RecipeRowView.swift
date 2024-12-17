//
//  RecipeRowView.swift
//  FetchRecipeApp
//
//  Created by R C on 12/16/24.
//

import SwiftUI

struct RecipeRowView: View {
    let recipe: Recipe
    @ObservedObject var viewModel: RecipeListViewModel

    var body: some View {
        HStack {
            // Recipe Image
            if let urlString = recipe.photoUrlSmall, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            // Recipe Details
            VStack(alignment: .leading, spacing: 5) {
                Text(recipe.name)
                    .font(.headline)
                HStack {
                    Image(FlagProvider.flagISO(for: recipe.cuisine))
                        .resizable()
                        .frame(width: 20, height: 15)
                    Text(recipe.cuisine)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()

            // Favorite Button
            Button(action: {
                viewModel.toggleFavorite(for: recipe)
            }) {
                Image(systemName: viewModel.isFavorite(recipe: recipe) ? "heart.fill" : "heart")
                    .foregroundColor(viewModel.isFavorite(recipe: recipe) ? .red : .gray)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
    }
}
