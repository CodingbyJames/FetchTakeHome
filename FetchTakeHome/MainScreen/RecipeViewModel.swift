//
//  RecipeViewModel.swift
//  FetchTakeHome
//
//  Created by James Garcia on 11/13/24.
//

import Foundation


@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var alertMessage: String? = nil
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }

    func fetchRecipes() async {
        do {
            let fetchedRecipes = try await networkManager.fetchRecipes()
            // Update the recipes list
            self.recipes = fetchedRecipes
        } catch {
            // Set error message for the alert
            self.alertMessage = "Failed to load recipes. Please try again."
        }
    }
}
