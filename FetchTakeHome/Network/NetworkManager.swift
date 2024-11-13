//
//  NetworkManager.swift
//  FetchTakeHome
//
//  Created by James Garcia on 11/13/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchRecipes() async throws -> [Recipe]
}

class NetworkManager: NetworkManagerProtocol {
    private let recipesURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!

    func fetchRecipes() async throws -> [Recipe] {
        // Simulate network delay
        try await Task.sleep(for: .seconds(2))
        
        let (data, _) = try await URLSession.shared.data(from: recipesURL)
        let decodedResponse = try JSONDecoder().decode(RecipeResponse.self, from: data)
        return decodedResponse.recipes
    }
}
