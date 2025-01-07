//
//  SearchViewModelTests.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 7/01/25.
//

import XCTest
import Combine

@testable import WeatherApp

final class SearchViewModelTests: XCTestCase {
    
    var viewModel: SearchViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        
        let apiManager = MockApiManager.shared
        apiManager.mock = MockHelper.listLocation
        
        self.viewModel = SearchViewModel(apiManager: apiManager, dataManager: MockDataManager.shared)
        
        self.cancellables = []
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.cancellables = nil
        super.tearDown()
    }
    
    func testSearchApiViewModel() {
        
        let expectation = XCTestExpectation(description: "Search api")
        
        CacheManager.shared.remove(query: "Pereira")
        
        self.viewModel.$locations
            .dropFirst() // Ignore the initial value
            .sink { locations in
                XCTAssertTrue(locations.count > 0 )
                expectation.fulfill()
            }
            .store(in: &self.cancellables)
        
        self.viewModel.searchLocations(query: "Pereira")
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testSearchCacheViewModel() {
        
        let expectation = XCTestExpectation(description: "Search cache")
        
        CacheManager.shared.save(query: "Pereira", items: [MockHelper.mockLocation])
        
        self.viewModel.$locations
            .dropFirst() // Ignore the initial value
            .sink { locations in
                XCTAssertTrue(locations.count > 0 )
                expectation.fulfill()
            }
            .store(in: &self.cancellables)
        
        self.viewModel.searchLocations(query: "Pereira")
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testSearchEmpty() {
        
        let expectation = XCTestExpectation(description: "Count should be incremented")
        
        self.viewModel.$locations
            .dropFirst() // Ignore the initial value
            .sink { locations in
                XCTAssertTrue(locations.isEmpty)
                expectation.fulfill()
            }
            .store(in: &self.cancellables)
        
        self.viewModel.searchLocations(query: "")
        
        wait(for: [expectation], timeout: 2.0)
    }
    
}
