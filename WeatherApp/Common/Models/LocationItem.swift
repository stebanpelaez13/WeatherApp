//
//  LocationItem.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//
import Foundation

/// Object que se usa para deserializar la data de busqueda de las ubicaciones
struct LocationItem: Codable, Identifiable {
    let name, region, country: String
    let id: Int
    let lon, lat: Double
    
    func getLocationRegion() -> String {
        if !self.region.isEmpty && self.country.isEmpty {
            return "\(self.region), \(self.country)"
        }
        return "\(self.region) \(self.country)"
    }
    
}
