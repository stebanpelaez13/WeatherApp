//
//  JSONHelper.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 5/01/25.
//

import Foundation

enum JSONHelper {
    
    static func encode<T: Codable>(_ object: T, type: T.Type) -> Data? {
        do {
            return try JSONEncoder().encode(object)
        } catch let error {
            print(error)
            return nil
        }
    }
    
    static func decode<T: Codable>(_ data: Data, type: T.Type) -> T? {
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch let error {
            print(error)
            return nil
        }
    }
    
}
