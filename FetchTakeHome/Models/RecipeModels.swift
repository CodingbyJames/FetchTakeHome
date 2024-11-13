//
//  RecipeModels.swift
//  FetchTakeHome
//
//  Created by James Garcia on 11/13/24.
//

import Foundation

struct RecipeResponse: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable {
    let name: String
    let cuisine: String
    let photo_url_small: String?
    let photo_url_large: String?
    let uuid: String
    let source_url: String?
    let youtube_url: String?
}
