//
//  MockDataManager.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import Foundation

/// Mocks para las #Previews y pruebas unitarias
class MockDataManager: DataManagerProtocol {
    
    static let shared = MockDataManager()
    
    func setCache(query: String, items: [LocationItem]) {
        
    }
    
    func cacheResults(query: String) -> [LocationItem]? {
        return nil
    }
    
    func fetchFavourites() -> [LocationItem] {
        return [MockHelper.mockLocation]
    }
    
    func add(_ item: LocationItem) {
        
    }
    
    func remove(_ item: LocationItem) {
        
    }
    
    func isFavorite(_ item: LocationItem) -> Bool {
        return false
    }
    
}
