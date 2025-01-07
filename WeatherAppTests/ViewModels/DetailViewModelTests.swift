//
//  DetailViewModelTests.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 7/01/25.
//

import XCTest
import Combine

@testable import WeatherApp

final class DetailViewModelTests: XCTestCase {
    
    var viewModel: DetailViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        
        let apiManager = MockApiManager.shared
        apiManager.mock = MockHelper.getMockWeather()
        
        self.viewModel = DetailViewModel(apiManager: apiManager, dataManager: MockDataManager.shared)
        
        self.cancellables = []
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.cancellables = nil
        super.tearDown()
    }
    
    func testDetailViewModel() {
        
        let expectation = XCTestExpectation(description: "Detail get api")
        
        self.viewModel.$weatherItem
            .dropFirst()
            .sink { item in
                expectation.fulfill()
            }
            .store(in: &self.cancellables)
        
        self.viewModel.detailWeather(MockHelper.mockLocation)
        
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertTrue(self.viewModel.hoursForecast.count > 0)
        XCTAssertTrue(self.viewModel.daysForecast.count > 0)
        
        XCTAssertNotNil(self.viewModel.imageCurrent())
        XCTAssertNotNil(self.viewModel.imageFor(code: 1000))
        
        XCTAssertTrue(self.viewModel.timeFor(time: "").isEmpty)
        XCTAssertFalse(self.viewModel.timeFor(time: "2025-01-06 14:00").isEmpty)
        
        XCTAssertFalse(self.viewModel.dayFor(day: "2025-01-06").isEmpty)
        XCTAssertFalse(self.viewModel.value(.temp).isEmpty)
        XCTAssertFalse(self.viewModel.value(.feels).isEmpty)
        XCTAssertFalse(self.viewModel.value(.uv).isEmpty)
        XCTAssertFalse(self.viewModel.value(.humidity).isEmpty)
        XCTAssertFalse(self.viewModel.value(.wind).isEmpty)
        XCTAssertFalse(self.viewModel.value(.windDir).isEmpty)
        XCTAssertFalse(self.viewModel.value(.rangeTemp).isEmpty)
        XCTAssertFalse(self.viewModel.value(.cloud).isEmpty)
        XCTAssertFalse(self.viewModel.value(.sunrise).isEmpty)
        XCTAssertFalse(self.viewModel.value(.sunset).isEmpty)
    }
    
    func testIsFavourite() {
        
        let expectation = XCTestExpectation(description: "Detail get api")
        
        self.viewModel.toogleFavourite(MockHelper.mockLocation)
        
        self.viewModel.$isFavourite
            .dropFirst()
            .sink { favourite in
                XCTAssertFalse(favourite)
                expectation.fulfill()
            }
            .store(in: &self.cancellables)
        
        self.viewModel.toogleFavourite(MockHelper.mockLocation)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testLoadFavourite() {
        
        let expectation = XCTestExpectation(description: "Detail get api")
        
        self.viewModel.$isFavourite
            .dropFirst()
            .sink { favourite in
                XCTAssertFalse(favourite)
                expectation.fulfill()
            }
            .store(in: &self.cancellables)
        
        self.viewModel.loadFavorite(MockHelper.mockLocation)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
}
