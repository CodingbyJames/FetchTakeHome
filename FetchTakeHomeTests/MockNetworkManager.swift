//
//  MockNetworkManager.swift
//  FetchTakeHomeTests
//
//  Created by James Garcia on 11/13/24.
//

import Foundation

class MockNetworkManager: NetworkManager {
    var shouldFail = false
    
    override func fetchRecipes() async throws -> [Recipe] {
        if shouldFail {
            throw URLError(.badServerResponse)
        }
        
        // Return mock data for successful fetch
        return [
            Recipe(name: "Test Recipe 1", cuisine: "Italian", photo_url_small: "https://example.com/small.jpg", uuid: "uuid-1"),
            Recipe(name: "Test Recipe 2", cuisine: "Mexican", photo_url_small: "https://example.com/small2.jpg", uuid: "uuid-2")
        ]
    }
}
