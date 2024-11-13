//
//  RecipeModels.swift
//  FetchTakeHome
//
//  Created by James Garcia on 11/13/24.
//

import Foundation

struct Recipe: Codable, Identifiable {
    let id: UUID
    let name: String
    let cuisine: String
    let photo_url_small: String?

    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name, cuisine
        case photo_url_small
    }
}

struct RecipeResponse: Codable {
    let recipes: [Recipe]
}
