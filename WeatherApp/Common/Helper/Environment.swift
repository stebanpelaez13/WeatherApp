//
//  Environment.swift
//  WeatherApp
//
//  Created by Juan Esteban Peláez Martínez on 13/01/25.
//
import Foundation

public final class EnvironmentManager {
    
    public static let shared = EnvironmentManager()
    
    public var endPoint: String? {
        guard let endPoint = Bundle.main.infoDictionary?["API_URL"] as? String else { return nil }
        return endPoint
    }
    
    public var apiKey: String {
        guard let clientId = Bundle.main.infoDictionary?["API_KEY"] as? String else { return "" }
        return clientId
    }
    
    public func logConfiguration() {
        print(self.endPoint)
        print(self.apiKey)
    }
    
}
