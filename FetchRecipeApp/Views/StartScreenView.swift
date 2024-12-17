//
//  StartScreenView.swift
//  FetchRecipeApp
//
//  Created by R C on 12/17/24.
//

import SwiftUI

struct StartScreenView: View {
    @State private var navigateToList = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background Color
                Color(.systemBackground)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 30) {
                    // App Logo or Image
                    Image("menu") // Replace with your asset
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)

                    // App Tagline
                    Text("Discover Recipes That Delight")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)

                    // Start Button
                    NavigationLink(destination: RecipeListView()) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 200)
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}
