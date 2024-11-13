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
    func testFetchRecipes() async throws {
        // Simulate a successful fetch
        mockNetworkManager.shouldFail = false

        await viewModel.fetchRecipes()

        // Verify recipes are not empty
        XCTAssertFalse(viewModel.recipes.isEmpty)
    }

    @MainActor
    func testFetchRecipesWithError() async throws {
        // Simulate a failed fetch
        mockNetworkManager.shouldFail = true

        await viewModel.fetchRecipes()

        // Verify that an error message is shown
        XCTAssertNotNil(viewModel.alertMessage)
        XCTAssertEqual(viewModel.alertMessage, "Failed to load recipes. Please try again.")
    }
}
