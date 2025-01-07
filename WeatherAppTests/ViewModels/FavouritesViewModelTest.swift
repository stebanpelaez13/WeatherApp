//
//  FavouritesViewModelTest.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 7/01/25.
//

import XCTest
import Combine

@testable import WeatherApp

final class FavouritesViewModelTest: XCTestCase {
    
    var cancellables: Set<AnyCancellable> = []
    
    func testFetchFavourites() {
        
        let viewModel = FavouritesViewModel(apiManager: MockApiManager.shared, dataManager: MockDataManager.shared)
        
        let expectation = XCTestExpectation(description: "fetch favourites")
                
        viewModel.$favourites
            .dropFirst() // Ignore the initial value
            .sink { favourites in
                XCTAssertTrue(favourites.count > 0 )
                expectation.fulfill()
            }
            .store(in: &self.cancellables)
        
        viewModel.fetchFavourites()
        
        wait(for: [expectation], timeout: 1.0)
    }
    
}
