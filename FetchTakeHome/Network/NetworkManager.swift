//
//  NetworkManager.swift
//  FetchTakeHome
//
//  Created by James Garcia on 11/13/24.
//

import Foundation

class NetworkManager {
    let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!

    func fetchRecipes() async throws -> [Recipe] {
        let (data, _) = try await URLSession.shared.data(from: url)

        let decoder = JSONDecoder()
        let recipeResponse = try decoder.decode(RecipeResponse.self, from: data)

        return recipeResponse.recipes
    }
}
