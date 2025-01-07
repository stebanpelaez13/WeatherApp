//
//  CacheManager.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 5/01/25.
//

protocol CacheManagerProtocol: AnyObject {
    func save(query: String, items: [LocationItem])
    func results(query: String) -> [LocationItem]?
}

class CacheManager: CacheManagerProtocol {
    
    static let shared = CacheManager()
    
    /// Se usa este diccionario para optimizar las busquedas y no acceder siempre a la API
    private var queryCache: [String: [LocationItem]] = [:]
    
    func save(query: String, items: [LocationItem]) {
        self.queryCache[query] = items
    }
    
    func results(query: String) -> [LocationItem]? {
        return self.queryCache[query]
    }
    
}
