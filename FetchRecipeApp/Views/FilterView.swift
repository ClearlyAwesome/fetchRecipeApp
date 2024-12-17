//
//  FilterView.swift
//  FetchRecipeApp
//
//  Created by R C on 12/16/24.
//
 
import SwiftUI

struct FilterView: View {
    @Binding var selectedCountries: Set<String>
    @Binding var showFavorites: Bool
    @ObservedObject var viewModel: RecipeListViewModel
    @Environment(\.dismiss) var dismiss // For DONE and CANCEL actions

    // Temp state for country filter (to allow cancel)
    @State private var tempSelectedCountries: Set<String> = []

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // MARK: - Sort Recipes
                HStack {
                    Text("Sort Recipes")
                        .font(.headline)

                    Picker("Sort Order", selection: $viewModel.sortOrder) {
                        ForEach(RecipeListViewModel.SortOrder.allCases, id: \.self) { order in
                            Text(order.rawValue).tag(order)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding(.horizontal)

                // MARK: - Filter by Country
                VStack(alignment: .leading) {

                    NavigationLink(destination: CountrySelectionView(
                        tempSelectedCountries: $tempSelectedCountries,
                        uniqueCountries: viewModel.uniqueCountries
                    )) {
                        HStack {
                            Text("Filter by Country")
                                .foregroundColor(.primary)
                                .font(.headline)
//                                .padding(.horizontal)
                            Spacer()
                            Text("\(tempSelectedCountries.count) selected")
                                .foregroundColor(.secondary)
                        }
                        .padding()
                    }
                }

                // MARK: - Show Favorites
                Toggle("Show Favorites", isOn: $showFavorites)
                    .font(.headline)
                    .padding(.horizontal)

                Spacer()
            }
            .padding(.vertical)
            .navigationTitle("Filter Recipes").navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss() // Dismiss without saving changes
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        selectedCountries = tempSelectedCountries // Save changes
                        dismiss()
                    }
                }
            }
        }
        .onAppear {
            tempSelectedCountries = selectedCountries // Initialize temp state
        }
    }
}
