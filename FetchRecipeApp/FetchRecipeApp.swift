//
//  FetchRecipeApp.swift
//  FetchRecipeApp
//
//  Created by R C on 12/16/24.
//

import SwiftUI

@main
struct FetchRecipeAppApp: App {
    var body: some Scene {
        WindowGroup {
            StartScreenView()
                .preferredColorScheme(.dark) // Force dark mode
        }
    }
}
