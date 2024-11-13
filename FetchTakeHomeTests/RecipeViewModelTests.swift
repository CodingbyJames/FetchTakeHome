//
//  RecipeViewModelTests.swift
//  FetchTakeHomeTests
//
//  Created by James Garcia on 11/13/24.
//

import XCTest
@testable import FetchTakeHome


class RecipeViewModelTests: XCTestCase {
    var viewModel: RecipeViewModel!
    var mockNetworkManager: MockNetworkManager!

    @MainActor
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        viewModel = RecipeViewModel(networkManager: mockNetworkManager)
    }

    @MainActor
    func testFetchWithValidData() async throws {
        mockNetworkManager.dataType = .valid
        await viewModel.fetchRecipes()
        XCTAssertFalse(viewModel.recipes.isEmpty)
        XCTAssertNil(viewModel.errorMessage)
    }

    @MainActor
    func testFetchWithMalformedData() async throws {
        mockNetworkManager.dataType = .malformed
        await viewModel.fetchRecipes()
        XCTAssertTrue(viewModel.recipes.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage) // Should indicate an error occurred
    }

    @MainActor
    func testFetchWithEmptyData() async throws {
        mockNetworkManager.dataType = .empty
        await viewModel.fetchRecipes()
        XCTAssertTrue(viewModel.recipes.isEmpty)
        XCTAssertNil(viewModel.errorMessage) // No recipes but no error either
    }
}

class MockNetworkManager: NetworkManagerProtocol {
    enum MockDataType: String {
        case valid = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        case malformed = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
        case empty = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    }

    var dataType: MockDataType = .valid

    func fetchRecipes() async throws -> [Recipe] {
        guard let url = URL(string: dataType.rawValue) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode(RecipeResponse.self, from: data)
        return decodedResponse.recipes
    }
}
