//
//  RecipeView.swift
//  FetchTakeHome
//
//  Created by James Garcia on 11/13/24.
//

import SwiftUI
import Kingfisher

struct RecipeListView: View {
    @StateObject var viewModel = RecipeViewModel()
    @State private var showAlert = false

    var body: some View {
        NavigationView {
            VStack {
                // Refresh button
                Button("Refresh") {
                    Task {
                        await viewModel.fetchRecipes()
                    }
                }
                .padding()

                // Display alert if there's an error
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"),
                          message: Text(viewModel.alertMessage ?? "Unknown error"),
                          dismissButton: .default(Text("OK")))
                }

                // Display recipes or a message if empty
                if viewModel.recipes.isEmpty {
                    Text("No recipes available")
                        .padding()
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.recipes) { recipe in
                                RecipeRowView(recipe: recipe)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
            .onAppear {
                Task {
                    await viewModel.fetchRecipes()
                }
            }
            .onChange(of: viewModel.alertMessage, { oldValue, newValue in
                showAlert = newValue != nil
            })
        }
    }
}

struct RecipeRowView: View {
    var recipe: Recipe

    var body: some View {
        HStack {
            if let imageURL = recipe.photo_url_small, let url = URL(string: imageURL) {
                KFImage(url)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            }
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text(recipe.cuisine)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding()
    }
}

