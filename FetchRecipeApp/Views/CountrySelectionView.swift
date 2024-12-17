//
//  CountrySelectionView.swift
//  FetchRecipeApp
//
//  Created by R C on 12/17/24.
//

import SwiftUI

// MARK: - Country Selection View
struct CountrySelectionView: View {
    @Binding var tempSelectedCountries: Set<String>
    let uniqueCountries: [String]

    var body: some View {
        List {
            // Select All/Deselect All row
            HStack {
                Button(action: toggleAllSelection) {
                    Text(selectAllTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
            }

            // Country selection rows
            ForEach(uniqueCountries, id: \.self) { country in
                HStack {
                    Text(country)
                    Spacer()
                    if tempSelectedCountries.contains(country) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.accentColor)
                    }
                }
                .contentShape(Rectangle()) // Makes the entire row tappable
                .onTapGesture {
                    toggleSelection(for: country)
                }
            }
        }
        .navigationTitle("Select Countries")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Select All/Deselect All Logic
    private var selectAllTitle: String {
        tempSelectedCountries.count == uniqueCountries.count ? "Deselect All" : "Select All"
    }

    private func toggleAllSelection() {
        if tempSelectedCountries.count == uniqueCountries.count {
            tempSelectedCountries.removeAll() // Deselect all
        } else {
            tempSelectedCountries = Set(uniqueCountries) // Select all
        }
    }

    private func toggleSelection(for country: String) {
        if tempSelectedCountries.contains(country) {
            tempSelectedCountries.remove(country)
        } else {
            tempSelectedCountries.insert(country)
        }
    }
}
