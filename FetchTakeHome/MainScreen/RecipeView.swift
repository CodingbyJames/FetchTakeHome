//
//  RecipeView.swift
//  FetchTakeHome
//
//  Created by James Garcia on 11/13/24.
//

import SwiftUI
import Kingfisher

struct RecipeView: View {
    @StateObject private var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading Recipes...")
                        .padding()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                } else if viewModel.recipes.isEmpty {
                    Text("No recipes available.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 8) {
                            ForEach(viewModel.recipes) { recipe in
                                HStack {
                                    if let imageUrl = recipe.photo_url_small {
                                        KFImage(URL(string: imageUrl))
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .cornerRadius(8)
                                    }
                                    VStack(alignment: .leading) {
                                        Text(recipe.name)
                                            .font(.headline)
                                        Text(recipe.cuisine)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .padding(.vertical, 4)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Recipes")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Refresh") {
                        Task {
                            await viewModel.fetchRecipes()
                        }
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchRecipes()
                }
            }
        }
    }
}
