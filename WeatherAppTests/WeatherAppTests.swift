//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Juan Esteban Pelaez on 3/01/25.
//

import SwiftUI
import Combine
import XCTest

@testable import WeatherApp

final class WeatherAppTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    override func tearDown() {
        cancellables = nil
        super.tearDown()
    }
    
    func testURLExtension() {
        let url = URL.concatenateUrl(nil, finalPath: ConstantsMock.endPointLocations)
        XCTAssertNotNil(url)
        
        let url2 = URL.concatenateUrl("test", finalPath: ConstantsMock.endPointLocations)
        XCTAssertNotNil(url2)
        
        let url3 = URL.concatenateUrl("test/", finalPath: "/test2")
        XCTAssertNotNil(url3)
        
        let url4 = URL.concatenateUrl("test/", finalPath: nil)
        XCTAssertNotNil(url4)
    }
    
    func testApiManagerExtension() {
        
        let errorInvalidURL = APIError.invalidURL
        XCTAssertEqual(errorInvalidURL.errorDescription, "Invalid URL")
        
        let errorUnknown = APIError.unknown
        XCTAssertEqual(errorUnknown.errorDescription, "Unknown")
        
        let errorUnexpectedResponse = APIError.unexpectedResponse
        XCTAssertEqual(errorUnexpectedResponse.errorDescription, "Unexpected response from the server")
        
        let errorCode = APIError.httpCode(404)
        XCTAssertEqual(errorCode.errorDescription, "Unexpected HTTP code: 404")
    }
    
    func testHelperMock() {
        
        let dataManager = MockDataManager.shared
        dataManager.setCache(query: "", items: [])
        _ = dataManager.cacheResults(query: "")
        _ = dataManager.fetchFavourites()
        
        let item = MockHelper.mockLocation
        
        dataManager.add(item)
        dataManager.remove(item)
        
        XCTAssertTrue(dataManager.isFavorite(item))
    }
    
    func testImageExtension() {
        
        for code in stride(from: 1282, through: 1273, by: -3) {
            let image = Image.weatherCodeToImage(code: code)
            let imageNight = Image.weatherCodeToImage(code: code, isNight: true)
            XCTAssertNotNil(image)
            XCTAssertNotNil(imageNight)
        }
        
        for code in stride(from: 1264, through: 1237, by: -3) {
            let image = Image.weatherCodeToImage(code: code)
            let imageNight = Image.weatherCodeToImage(code: code, isNight: true)
            XCTAssertNotNil(image)
            XCTAssertNotNil(imageNight)
        }
        
        for code in stride(from: 1225, through: 1180, by: -3) {
            let image = Image.weatherCodeToImage(code: code)
            let imageNight = Image.weatherCodeToImage(code: code, isNight: true)
            XCTAssertNotNil(image)
            XCTAssertNotNil(imageNight)
        }
        
        for code in stride(from: 1009, through: 1000, by: -3) {
            let image = Image.weatherCodeToImage(code: code)
            let imageNight = Image.weatherCodeToImage(code: code, isNight: true)
            XCTAssertNotNil(image)
            XCTAssertNotNil(imageNight)
        }
        
        let icon1171 = Image.weatherCodeToImage(code: 1171)
        XCTAssertNotNil(icon1171)
        
        let icon1168 = Image.weatherCodeToImage(code: 1168)
        XCTAssertNotNil(icon1168)
        
        let icon1153 = Image.weatherCodeToImage(code: 1153)
        XCTAssertNotNil(icon1153)
        
        let icon1150 = Image.weatherCodeToImage(code: 1150)
        XCTAssertNotNil(icon1150)
        
        let icon1147 = Image.weatherCodeToImage(code: 1147)
        XCTAssertNotNil(icon1147)
        
        let icon1135 = Image.weatherCodeToImage(code: 1135)
        XCTAssertNotNil(icon1135)
        
        let icon1117 = Image.weatherCodeToImage(code: 1117)
        XCTAssertNotNil(icon1117)
        
        let icon1114 = Image.weatherCodeToImage(code: 1114)
        XCTAssertNotNil(icon1114)
        
        let icon1087 = Image.weatherCodeToImage(code: 1087)
        XCTAssertNotNil(icon1087)
        
        for code in stride(from: 1072, through: 1063, by: -3) {
            let image = Image.weatherCodeToImage(code: code)
            let imageNight = Image.weatherCodeToImage(code: code, isNight: true)
            XCTAssertNotNil(image)
            XCTAssertNotNil(imageNight)
        }
        
        let icon1030 = Image.weatherCodeToImage(code: 1030)
        XCTAssertNotNil(icon1030)
        
        let iconNil = Image.weatherCodeToImage(code: 100)
        XCTAssertNil(iconNil)
    }
    
    
}
