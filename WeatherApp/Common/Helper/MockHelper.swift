//
//  MockHelper.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//
import Foundation

/// Mocks para las #Previews y pruebas unitarias
enum MockHelper {
    
    static let mockLocation = LocationItem(name: "Pereira", region: "Risaralda", country: "Colombia", id: 123456, lon: 4.81, lat: -75.7)
    
    static let listLocation = [
        mockLocation,
        LocationItem(name: "Bogota", region: "Cundinamarca", country: "Colombia", id: 123457, lon: 4.6, lat: -74.8),
        LocationItem(name: "Medellin", region: "Antioquia", country: "Colombia", id: 123458, lon: 6.29, lat: -75.54),
        LocationItem(name: "New York", region: "New York", country: "United States of America", id: 123459, lon: 40.71, lat: -74.01),
        LocationItem(name: "London", region: "City of London, Greater London", country: "United Kingdom", id: 123450, lon: 51.52, lat: -0.11)
    ]
    
}
