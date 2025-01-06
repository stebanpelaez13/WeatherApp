//
//  MockConstants.swift
//  WeatherAppTests
//
//  Created by Juan Esteban Peláez Martínez on 06/01/25.
//

import Foundation

@testable import WeatherApp

enum ConstantsMock {
    
    static let apiBase = "https://www.apiTest.com/api-gateway"
    static let endPointLocations = "locations/all"
    
    static let headers = [
        "cache-control": "no-cache, no-store, max-age=0, must-revalidate",
        "content-type": "application/json;charset=UTF-8",
        "date": "Tue, 18 Oct 2022 23:41:18 GMT",
        "expires": "0",
        "server": "Apache/2.4.18 (Ubuntu)",
        "Authorization": "12345",
        "strict-transport-security": "max-age=31536000; includeSubDomains; preload",
        "x-content-type-options": "nosniff",
        "x-frame-options": "DENY",
        "x-xss-protection": "1; mode=block"
    ]
    
    static let responseLocations = [
        [
            "id": 714482,
            "name": "Madrid",
            "region": "Madrid",
            "country": "Spain",
            "lat": 40.4,
            "lon": -3.68
        ],
        [
            "id": 698739,
            "name": "Barcelona",
            "region": "Catalonia",
            "country": "Spain",
            "lat": 41.38,
            "lon": 2.18
        ]
    ]
    
}
