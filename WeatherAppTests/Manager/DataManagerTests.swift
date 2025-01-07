//
//  DataManagerTests.swift
//  WeatherAppTests
//
//  Created by Juan Esteban Pelaez on 7/01/25.
//

import XCTest
import SwiftData

@testable import WeatherApp

final class DataManagerTests: XCTestCase {
    
    func testDataManager() {
        
        UserDefaults.standard.set(nil, forKey: Constants.Storage.keyFavourites)
        
        let manager: DataManagerProtocol = DataManager()
        
        let item = MockHelper.mockLocation
        
        manager.add(item)
        manager.add(item)
        
        let favourites = manager.fetchFavourites().count
        XCTAssertEqual(favourites, 1)
        
        let isFavorite = manager.isFavorite(item)
        
        XCTAssertTrue(isFavorite)
        
        manager.remove(item)
        
        let emptyFavourites = manager.fetchFavourites().count
        XCTAssertEqual(emptyFavourites, 0)
    }
    
}
