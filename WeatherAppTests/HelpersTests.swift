//
//  HelpersTests.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 7/01/25.
//

import XCTest
import SwiftData

@testable import WeatherApp

final class HelpersTests: XCTestCase {
    
    func testDateHelper() {
        
        let testDate = "2025-01-06"
        let testTime = "\(testDate) 14:00"
        
        let time = DateHelper.timeOfDay(from: testTime)
        XCTAssertEqual(time, "2 PM")
        
        let day = DateHelper.dayOfWeek(from: testDate)
        XCTAssertEqual(day, "Monday")
        
        let nilTime = DateHelper.timeOfDay(from: "")
        let nilDay = DateHelper.dayOfWeek(from: "")
        
        XCTAssertNil(nilTime)
        XCTAssertNil(nilDay)
    }
    
    func testJsonHelper() {
        
        let jsonString = """
            {
                "id": 123456,
                "name": "Pereira",
                "region": "Risaralda",
                "country": "Colombia",
                "lat": 10.821,
                "lon": -4.223,
            }
            """
        
        let item = MockHelper.mockLocation
        
        let locationData = JSONHelper.encode(item, type: LocationItem.self)
        XCTAssertNotNil(locationData)
        
        let json = jsonString.data(using: .utf8)!
        let locationDecode = JSONHelper.decode(json, type: LocationItem.self)
        XCTAssertEqual(locationDecode?.id, item.id)
        
        XCTAssertEqual(locationDecode?.getLocationRegion(), "Risaralda, Colombia")
        
        let emptyRegion = LocationItem(name: "Hong kong", region: "", country: "Hong kong", id: 10, lon: 0.0, lat: 0.0)
        XCTAssertEqual(emptyRegion.getLocationRegion(), "Hong kong")
    }
    
}
