//
//  RecipeViewModel.swift
//  FetchTakeHome
//
//  Created by James Garcia on 11/13/24.
//

import SwiftUI

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }

    func fetchRecipes() async {
        isLoading = true
        defer { isLoading = false }

        do {
            recipes = try await networkManager.fetchRecipes()
        } catch {
            errorMessage = "Failed to load recipes. Please try again."
        }
    }
}
